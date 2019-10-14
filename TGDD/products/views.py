from django.shortcuts import render
from .models import Product
from categories.models import Category
from .serializers import ProductSerializer, ProductCreateUpdateSerializer
from rest_framework import generics, status
from rest_framework import filters
from rest_framework.response import Response
from .paginations import *


class ProductListView(generics.ListCreateAPIView):
    queryset            = Product.objects.all()
    serializer_class    = ProductSerializer
    pagination_class = CustomPagination
    
    # filter_backends = [filters.SearchFilter]
    # filter_fields = ['name', 'specifications']

    def post (self, request):
        serializer = ProductCreateUpdateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def list(self, request):
        brand       = request.GET.get('brand', None)
        category    = request.GET.get('category', None)
        queryset    = Product.objects.order_by('-id')
        
        if brand:
            queryset = queryset.filter(brand__id=brand)
        elif category:
            queryset = queryset.filter(category__id=category)
        serializer = ProductSerializer(queryset, many=True)
        return Response(data=serializer.data)


class ProductDetailView(generics.RetrieveDestroyAPIView):
    queryset            = Product.objects.all()
    serializer_class    = ProductSerializer


class ProductUpdateView(generics.UpdateAPIView):
    queryset            = Product.objects.all()
    serializer_class    = ProductCreateUpdateSerializer