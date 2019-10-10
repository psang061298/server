from rest_framework import serializers
from .models import Brand

class BrandSerializer (serializers.ModelSerializer):
    created_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Brand
        fields  = ('id', 'name', 'country', 'logo', 'is_active', 'created_at', 'updated_at')
        