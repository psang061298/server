from django.shortcuts import render
from .models import Cart, CartItem
from .serializers import CartSerializer, CartItemSerializer, CartItemListSerializer
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.response import Response
from django.http import Http404
from django_filters.rest_framework import DjangoFilterBackend as BasicDjangoFilterBackend
from url_filter.integrations.drf import DjangoFilterBackend
from promotion.models import Promotion
from datetime import date
from products.models import Product


class CartListView(generics.ListAPIView):
    queryset            = Cart.objects.all()
    serializer_class    = CartSerializer
    permission_classes  = (IsAdminUser,)

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all()
        return self.queryset.filter(customer=self.request.user)


# class CartDetailView(generics.RetrieveUpdateDestroyAPIView):
#     queryset            = Cart.objects.all()
#     serializer_class    = CartSerializer

class CartItemListView(generics.ListCreateAPIView):
    queryset            = CartItem.objects.all().order_by('-id')
    serializer_class    = CartItemSerializer
    permission_classes  = (IsAuthenticated,)
    filter_backends     = [BasicDjangoFilterBackend, DjangoFilterBackend]
    filter_fields       = ['paid',]

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all()
        return self.queryset.filter(cart=self.request.user.id, paid=False)

    def list(self, request):
        cart_items = CartItem.objects.filter(cart=request.user.id, paid=False)
        sale_price = 0
        for item in cart_items:
            promotions = Promotion.objects.filter(start_date__lte= date.today(), end_date__gt= date.today(), category=item.product.category)
            if  len(promotions) > 0:
                sale_price = item.product.price * (100 - promotions[0].percent) / 100
            else:
                sale_price = item.product.price
            item.final_price = sale_price * item.quantity    
            item.save()
        queryset = self.get_queryset()
        serializer = CartItemListSerializer(queryset, many=True)
        return Response(data = serializer.data)

    def post (self, request):
        serializer = CartItemSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            cart        = Cart.objects.get(pk=request.user.id)
            product     = Product.objects.get(pk=request.data['product'])

            if request.data['quantity'] > product.quantity: # Số lượng k đc lớn hơn số lượng còn trong kho
                return Response("There are not enough products in stock!")



            promotions  = Promotion.objects.filter(start_date__lte= date.today(), end_date__gt= date.today(), category=product.category)
            sale_price  = 0
            if len(promotions) > 0:
                sale_price  = (product.price * (100 - promotions[0].percent) / 100)
            else:
                sale_price  = product.price
            final_price = sale_price * request.data['quantity']
            serializer.save(cart=cart, final_price=final_price)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CartItemDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = CartItem.objects.all()
    serializer_class    = CartItemSerializer
    permission_classes  = (IsAuthenticated,)

    def get_object(self, pk):
        try:
            if self.request.user.is_admin:
                return CartItem.objects.get(pk=pk)
            else:
                return CartItem.objects.get(pk=pk, cart=self.request.user.id)
        except:
            raise Http404

    def get(self, request, pk, format=None):
        cartItem = self.get_object(pk)
        serializer = CartItemSerializer(cartItem)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        cartItem    = self.get_object(pk)
        serializer  = CartItemSerializer(cartItem, data=request.data)
        sale_price  = 0
        if serializer.is_valid():
            product     = Product.objects.get(pk=request.data['product'])
            promotions  = Promotion.objects.filter(start_date__lte= date.today(), end_date__gt= date.today(), category=product.category)
            if len(promotions) > 0:
                sale_price = (product.price * (100 - promotions[0].percent) / 100)
            else:
                sale_price = product.price
            final_price = sale_price * request.data['quantity']
            serializer.save(final_price=final_price)
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        cartItem = self.get_object(pk)
        cartItem.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)