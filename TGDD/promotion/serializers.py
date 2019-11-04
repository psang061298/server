from rest_framework import serializers
from .models import Promotion

class PromotionSerializer (serializers.ModelSerializer):
    created_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    start_date  = serializers.DateField(format="%d-%m-%Y")
    end_date    = serializers.DateField(format="%d-%m-%Y")

    class Meta:
        model   = Promotion
        fields  = ['id', 'title', 'category', 'percent', 'start_date', 'end_date', 'description', 'image', 'created_at', 'updated_at']
        # read_only_fields = ('description', 'images', 'is_active', 'specifications', 'created_at', 'updated_at')
        depth   = 1


class PromotionCreateUpdateSerializer (serializers.ModelSerializer):
    created_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    start_date  = serializers.DateField(format="%d-%m-%Y")
    end_date    = serializers.DateField(format="%d-%m-%Y")

    class Meta:
        model   = Promotion
        fields  = ['id', 'title', 'category', 'percent', 'start_date', 'end_date', 'description', 'image', 'created_at', 'updated_at']