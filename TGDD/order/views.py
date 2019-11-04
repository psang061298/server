from django.shortcuts import render
from .models import Order
from .serializers import OrderSerializer, OrderCreateUpdateSerializer
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
from promotion.models import Promotion
from datetime import date


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
        promotions = Promotion.objects.all()
        paid_items = CartItem.objects.filter(cart=request.user.id, paid=False)
        for item in paid_items:
            for p in promotions:
                if p.start_date <= date.today() and p.end_date > date.today() and item.product.category == p.category:
                    sale_price = item.product.price * (100 - p.percent) / 100
                    # item.final_price = sale_price
                    print(sale_price)
                    break

        # stripe.api_key = STRIPE_SECRET_KEY

        # stripe_customer = stripe.Customer.create(
        #     card = request.data['token'],
        #     description = request.user.fullname
        # )

        # charge = stripe.Charge.create (
        #     amount = request.data['total_price'],
        #     currency='VND',
        #     description = request.data['description'],
        #     customer=stripe_customer,
        # )
        # print(charge.id)
        # print(charge)
        serializer = OrderCreateUpdateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            # serializer.save(buyer=request.user, token=charge.id)
            # for item in paid_items:
                # item.paid = True
                # item.save()
                # pro             = Product.objects.get(pk=item.product.id)
                # pro.quantity    = pro.quantity - item.quantity
                # pro.save()

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class OrderDetailView(generics.RetrieveDestroyAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderSerializer


class OrderUpdateView(generics.UpdateAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderCreateUpdateSerializer
    permission_classes  = (IsAuthenticated,)