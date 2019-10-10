from rest_framework import serializers
from .models import Cart, CartItem


class CartSerializer (serializers.ModelSerializer):
    class Meta:
        model   = Cart
        # fields  = '__all__'
        fields = ['customer', 'cart_items']
        depth = 2


class CartItemSerializer (serializers.ModelSerializer):
    class Meta:
        model   = CartItem
        fields  = '__all__'