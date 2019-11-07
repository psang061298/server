from rest_framework import serializers
from .models import Order
import stripe
from TGDD.settings import STRIPE_SECRET_KEY


class OrderSerializer (serializers.ModelSerializer):
    ordered_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Order
        fields  = ['id', 'status', 'total_price', 'shipping_address', 'bill_address', 'description', 'token', 'receipt_url', 'buyer', 'ordered_at', 'updated_at']
        depth   = 1

class OrderCreateUpdateSerializer (serializers.ModelSerializer):
    ordered_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Order
        fields  = ['id', 'status', 'total_price', 'shipping_address', 'bill_address', 'description', 'token', 'receipt_url', 'buyer', 'ordered_at', 'updated_at']
        read_only_fields = ('buyer', 'total_price')