from rest_framework import serializers
from .models import Order


class OrderSerializer (serializers.ModelSerializer):
    ordered_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Order
        fields  = ['id', 'status', 'total_price', 'bill_address', 'receiver_name', 'receiver_address', 'receiver_phone', 'description', 'token', 'buyer', 'ordered_at', 'updated_at']
        depth   = 2

class OrderCreateUpdateSerializer (serializers.ModelSerializer):
    ordered_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Order
        fields  = ['id', 'status', 'total_price', 'bill_address', 'receiver_name', 'receiver_address', 'receiver_phone', 'description', 'token', 'buyer', 'ordered_at', 'updated_at']