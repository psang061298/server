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
    
    # filter_backends = [filters.SearchFilter]
    # filter_fields = ['name', 'specifications']

    # pagination_class = CustomPagination

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
<<<<<<< HEAD
        
        if name:
            queryset = queryset.filter(name__icontains=name)
        elif category and brand:
            if gt and lt:
                queryset = queryset.filter(category=category, brand=brand, price__gte=(gt),price__lte=(lt))
            elif gt:
                queryset = queryset.filter(category=category, brand=brand, price__gte=(gt))
            elif lt:
                queryset = queryset.filter(category=category, brand=brand, price__lte=(lt))
            else:
                queryset = queryset.filter(category=category, brand=brand)
=======
        if brand:
            queryset = queryset.filter(brand__id=brand)
>>>>>>> parent of b311765... Thêm filter theo khoảng giá, search theo name
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