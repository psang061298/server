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


class OrderListView(generics.ListCreateAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderSerializer
    permission_classes  = (IsAuthenticated,)
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['status',]

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.order_by('-id')
        return self.queryset.filter(buyer=self.request.user).order_by('-id')

    def post (self, request):
        paid_items = CartItem.objects.filter(cart=request.user.id, paid=False)
        total_price = 0
        for item in paid_items:
            if item.final_price > 0:
                total_price += item.final_price
            else:
                total_price += item.product.price
        if total_price == 0:
            return Response("Can not make a payment! Your cart is empty.")
        if total_price > 99999999:
            return Response("Total price must be no more than 99999999 VND! Please adjust the quantity of items in your cart!")
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

    def list(self, request):
        queryset = self.queryset.all()
        month = request.GET.get('month', None)
        if month is not None:
            all_orders = Order.objects.all()
            month_orders = []
            for order in all_orders:
                print(order.ordered_at.month)
                if order.ordered_at.month == month:
                    print(order)
                    month_orders.append(order)
            return Response(month_orders)
        serializer = StatisticsSerializer(queryset, many=True)
        return Response(data=serializer.data)