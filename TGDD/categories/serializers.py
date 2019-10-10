from rest_framework import serializers
from .models import Category

class CategorySerializer (serializers.ModelSerializer):
    created_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Category
        fields  = ('id', 'title', 'image', 'is_active', 'created_at', 'updated_at')


class CategoryDetailSerializer (serializers.ModelSerializer):
    created_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Category
        fields  = ('id', 'title', 'image', 'is_active', 'created_at', 'updated_at')