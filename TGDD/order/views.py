from django.shortcuts import render
from .models import Order
from .serializers import OrderSerializer, OrderCreateUpdateSerializer, StatisticsSerializer
from rest_framework import generics, status
from rest_framework import filters
from rest_framework.response import Response
import stripe
from accounts.models import Member
from TGDD.settings import STRIPE_SECRET_KEY
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
from cart.models import CartItem
from products.models import Product
from django.core.paginator import Paginator
from rest_framework.pagination import PageNumberPagination
from products.paginations import CustomPagination
import json


class OrderListView(generics.ListCreateAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderSerializer
    permission_classes  = (IsAuthenticated,)
    filter_backends     = [DjangoFilterBackend]
    filterset_fields    = ['status',]
    pagination_class = (CustomPagination)

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all().order_by('-id')
        return self.queryset.filter(buyer=self.request.user).order_by('-id')

    def list(self, request):
        queryset = self.get_queryset()
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = ProductSerializer(queryset, many=True)
        return Response(data=serializer.data)    

    def post (self, request):
        paid_items = CartItem.objects.filter(cart=request.user.id, paid=False)
        total_price = 0
        for item in paid_items:
            if item.final_price > 0:
                total_price += item.final_price
            else:
                total_price += item.product.price
        if total_price == 0:
            return Response("Can not make a payment! Your cart is empty.", status=status.HTTP_400_BAD_REQUEST)
        if total_price > 99999999:
            return Response("Total price must be no more than 99999999 VND! Please adjust the quantity of items in your cart!", status=status.HTTP_400_BAD_REQUEST)
        if request.data['token'] is not None and request.data['token'] != "":
            stripe.api_key = STRIPE_SECRET_KEY

            stripe_customer = stripe.Customer.create(
                card = request.data['token'],
                description = request.user.fullname
            )

            description = ""
            if request.data['description'] != None and request.data['description'] != "":
                description = request.data['description']
            charge = stripe.Charge.create (
                amount = int(total_price),
                currency='VND',
                description = description,
                customer=stripe_customer,
            )
            print(charge)
        serializer = OrderCreateUpdateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            if request.data['token'] is not None and request.data['token'] != "":
                serializer.save(buyer=request.user, token=charge.id, total_price=total_price, receipt_url=charge.receipt_url)
            else:
                serializer.save(buyer=request.user, total_price=total_price) 
            new_order = Order.objects.get(pk=serializer.data['id'])
            for item in paid_items:
                item.paid       = True
                item.order      = new_order
                item.save()
                pro             = Product.objects.get(pk=item.product.id)
                pro.quantity    = pro.quantity - item.quantity
                pro.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class OrderDetailView(generics.RetrieveDestroyAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderSerializer


class OrderUpdateView(generics.UpdateAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderCreateUpdateSerializer
    permission_classes  = (IsAuthenticated,)


class StatisticsView(generics.ListAPIView):
    queryset            = Order.objects.all().order_by('-id')
    serializer_class    = StatisticsSerializer
    # pagination_class = (CustomPagination)

    def list(self, request):
        queryset = self.queryset.all()

        months = []
        statistics = []
        for item in queryset:
            # if item.ordered_at.month == this_month and item.ordered_at.year == this_year:
            #     monthly_total += item.products.final_price
            # elif :
            #     pass
            existed = False
            if len(months) == 0:
                months.append(str(item.ordered_at.month)+"-"+str(item.ordered_at.year))
            else:
                for month in months:
                    if month == str(item.ordered_at.month)+"-"+str(item.ordered_at.year):
                        existed = True
                        break
                if existed == False:
                    months.append(str(item.ordered_at.month)+"-"+str(item.ordered_at.year))

        for month in months:
            total_revenue = 0
            for item in queryset:
                if str(item.ordered_at.month)+"-"+str(item.ordered_at.year) == month:
                    cartItems = CartItem.objects.filter(order=item)
                    for cart in cartItems:
                        total_revenue += cart.quantity
            stat = {
                "month": month,
                "revenue": str(total_revenue)
            }

            statistics.append(stat)
        print(statistics)
        # month = request.GET.get('month', None)
        
        # if month is not None:
        #     month = int(month)
        #     all_orders = Order.objects.all().order_by('-id')
        #     month_orders = []
        #     for order in all_orders:
        #         if order.ordered_at.month == month:
        #             month_orders.append(order)
        #     queryset = month_orders

        # serializer = StatisticsSerializer(statistics, many=True)
        # serializer = StatisticsSerializer(queryset, many=True)

        # # page = self.paginate_queryset(queryset)
        # # if page is not None:
        # #     serializer = self.get_serializer(page, many=True)
        # #     return self.get_paginated_response(serializer.data)
        return Response(statistics)