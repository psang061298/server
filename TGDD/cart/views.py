from django.shortcuts import render
from .models import Cart, CartItem
from .serializers import CartSerializer, CartItemSerializer
from rest_framework import generics



class CartListView(generics.ListCreateAPIView):
    queryset            = Cart.objects.all()
    serializer_class    = CartSerializer

class CartDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Cart.objects.all()
    serializer_class    = CartSerializer

class CartItemListView(generics.ListCreateAPIView):
    queryset            = CartItem.objects.all()
    serializer_class    = CartItemSerializer

class CartItemDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = CartItem.objects.all()
    serializer_class    = CartItemSerializer