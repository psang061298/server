from django.shortcuts import render
from .models import Address
from .serializers import AddressSerializer
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated


class AddressListView(generics.ListCreateAPIView):
    queryset            = Address.objects.all()
    serializer_class    = AddressSerializer
    permission_classes  = (IsAuthenticated,)
    
    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.order_by('-id')
        return self.queryset.filter(member=self.request.user).order_by('-id')


class AddressDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Address.objects.all()
    serializer_class    = AddressSerializer
    permission_classes  = (IsAuthenticated,)
    
    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all()
        return self.queryset.filter(member=self.request.user)