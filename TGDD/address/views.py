from django.shortcuts import render
from .models import Address
from .serializers import AddressSerializer
from rest_framework import generics


class AddressListView(generics.ListCreateAPIView):
    queryset            = Address.objects.all()
    serializer_class    = AddressSerializer
    
    def get_queryset(self):
        return self.queryset.order_by('-id')


class AddressDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Address.objects.all()
    serializer_class    = AddressSerializer
    