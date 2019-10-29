from django.shortcuts import render
from .models import Brand
from .serializers import BrandSerializer
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.permissions import IsAdminUser
from categories.permissions import IsAdminOrReadOnly


class BrandListView(generics.ListCreateAPIView):
    queryset            = Brand.objects.order_by('-id')
    serializer_class    = BrandSerializer
    permission_classes  = (IsAdminOrReadOnly,)

    def get_queryset(self):
        return self.queryset.filter(is_active=True)

    def list (self, request):
        if not request.user.is_anonymous:
            if request.user.admin == True:
                queryset    = self.queryset.all()
                serializer  = BrandSerializer(queryset, many=True)
                return Response(data=serializer.data)
        queryset    = self.get_queryset()
        serializer  = BrandSerializer(queryset, many=True)
        return Response(data=serializer.data)


class BrandDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Brand.objects.all()
    serializer_class    = BrandSerializer
    permission_classes  = (IsAdminUser,)