from django.shortcuts import render
from .models import Category
from .serializers import CategorySerializer, CategoryDetailSerializer
from rest_framework import generics
# from django.utils import timezone
# from rest_framework.response import Response
# from rest_framework import status


class CategoryList(generics.ListCreateAPIView):
    queryset            = Category.objects.all()
    serializer_class    = CategorySerializer

    def get_queryset(self):
        return self.queryset.filter(is_active=True)


class CategoryDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Category.objects.all()
    serializer_class    = CategoryDetailSerializer