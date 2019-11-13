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
        read_only_fields = ('cart',)

class CartItemUpdateSerializer (serializers.ModelSerializer):
    class Meta:
        model   = CartItem
        fields  = '__all__'
        read_only_fields = ('cart', 'product')

class CartItemListSerializer (serializers.ModelSerializer):
    class Meta:
        model   = CartItem
        fields  = '__all__'
        depth = 1