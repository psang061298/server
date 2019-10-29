from django.shortcuts import render
from .models import Cart, CartItem
from .serializers import CartSerializer, CartItemSerializer
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.response import Response


class CartListView(generics.ListCreateAPIView):
    queryset            = Cart.objects.all()
    serializer_class    = CartSerializer
    permission_classes  = (IsAuthenticated,)

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all()
        return self.queryset.filter(customer=self.request.user)

class CartDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Cart.objects.all()
    serializer_class    = CartSerializer

class CartItemListView(generics.ListCreateAPIView):
    queryset            = CartItem.objects.all()
    serializer_class    = CartItemSerializer
    permission_classes  = (IsAdminUser,)

class CartItemDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = CartItem.objects.all()
    serializer_class    = CartItemSerializer
    permission_classes  = (IsAuthenticated,)