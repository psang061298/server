from rest_framework import serializers
from .models import Product
from .fields import JSONSerializerSpecField


class ProductSerializer (serializers.ModelSerializer):
    created_at      = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at      = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    images          = serializers.ListField(child=serializers.CharField())
    specifications  = JSONSerializerSpecField()
    class Meta:
        model   = Product
        fields  = ['id', 'name', 'brand','description', 'images', 'price', 'quantity', 'is_active', 'category', 'specifications', 'created_at', 'updated_at']
        depth   = 2

class ProductCreateUpdateSerializer (serializers.ModelSerializer):
    created_at      = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at      = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    images          = serializers.ListField(child=serializers.CharField())
    specifications  = JSONSerializerSpecField()
    class Meta:
        model   = Product
        fields  = ['id', 'name', 'brand','description', 'images', 'price', 'quantity', 'is_active', 'category', 'specifications', 'created_at', 'updated_at']