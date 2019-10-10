from django.shortcuts import render
from .models import Brand
from .serializers import BrandSerializer
from rest_framework import generics


class BrandListView(generics.ListCreateAPIView):
    queryset            = Brand.objects.all()
    serializer_class    = BrandSerializer


class BrandDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Brand.objects.all()
    serializer_class    = BrandSerializer
    