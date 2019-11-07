from django.shortcuts import render
from .models import Address
from .serializers import AddressSerializer
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response


class AddressListView(generics.ListCreateAPIView):
    queryset            = Address.objects.all()
    serializer_class    = AddressSerializer
    permission_classes  = (IsAuthenticated,)
    
    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.order_by('-id')
        return self.queryset.filter(member=self.request.user).order_by('-id')

    def post (self, request):
        serializer = AddressSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save(member=request.user)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class AddressDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Address.objects.all()
    serializer_class    = AddressSerializer
    permission_classes  = (IsAuthenticated,)
    
    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.all()
        return self.queryset.filter(member=self.request.user)