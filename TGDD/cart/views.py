from django.shortcuts import render
from .models import Cart, CartItem
from .serializers import CartSerializer, CartItemSerializer
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.response import Response
from django.http import Http404
from django_filters.rest_framework import DjangoFilterBackend as BasicDjangoFilterBackend
from url_filter.integrations.drf import DjangoFilterBackend


class CartListView(generics.ListAPIView):
    queryset            = Cart.objects.all()
    serializer_class    = CartSerializer
    permission_classes  = (IsAuthenticated,)

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all()
        return self.queryset.filter(customer=self.request.user)

# class CartDetailView(generics.RetrieveUpdateDestroyAPIView):
#     queryset            = Cart.objects.all()
#     serializer_class    = CartSerializer

class CartItemListView(generics.ListCreateAPIView):
    queryset            = CartItem.objects.all()
    serializer_class    = CartItemSerializer
    permission_classes  = (IsAuthenticated,)
    filter_backends     = [BasicDjangoFilterBackend, DjangoFilterBackend]
    filter_fields       = ['paid',]

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all()
        return self.queryset.filter(cart=self.request.user.id)

    def post (self, request):
        serializer = CartItemSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            cart = Cart.objects.get(pk=request.user.id)
            serializer.save(cart=cart)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CartItemDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = CartItem.objects.all()
    serializer_class    = CartItemSerializer
    permission_classes  = (IsAuthenticated,)

    def get_object(self, pk):
        try:
            if self.request.user.is_authenticated:
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
        cartItem = self.get_object(pk)
        serializer = CartItemSerializer(cartItem, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        cartItem = self.get_object(pk)
        cartItem.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)