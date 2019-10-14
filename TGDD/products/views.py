from django.shortcuts import render
from .models import Product
from categories.models import Category
from .serializers import ProductSerializer, ProductCreateUpdateSerializer
from rest_framework import generics, status
from rest_framework.response import Response
from .paginations import *


class ProductListView(generics.ListCreateAPIView):
    queryset            = Product.objects.all()
    serializer_class    = ProductSerializer

    pagination_class = CustomPagination

    def post (self, request):
        serializer = ProductCreateUpdateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def list(self, request):
        brand       = request.GET.get('brand', None)
        category    = request.GET.get('category', None)
        gt          = request.GET.get('gt', None)
        lt          = request.GET.get('lt', None)
        name        = request.GET.get('name', None)
        queryset    = Product.objects.order_by('-id')
        
        elif category:
            if gt and lt:
                queryset = queryset.filter(category=category, price__gte=(gt),price__lte=(lt))
            elif gt:
                queryset = queryset.filter(category=category, price__gte=(gt))
            elif lt:
                queryset = queryset.filter(category=category, price__lte=(lt))
            else:
                queryset = queryset.filter(category=category)
        elif brand:
            if gt and lt:
                queryset = queryset.filter(brand=brand, price__gte=(gt),price__lte=(lt))
            elif gt:
                queryset = queryset.filter(brand=brand, price__gte=(gt))
            elif lt:
                queryset = queryset.filter(brand=brand, price__lte=(lt))
            else:
                queryset = queryset.filter(brand=brand)
        else:
            if gt and lt:
                queryset = queryset.filter(price__gte=(gt),price__lte=(lt))
            elif gt:
                queryset = queryset.filter(price__gte=(gt))
            else:
                queryset = queryset.filter(price__lte=(lt))

        serializer = ProductSerializer(queryset, many=True)
        return Response(data=serializer.data)


class ProductDetailView(generics.RetrieveDestroyAPIView):
    queryset            = Product.objects.all()
    serializer_class    = ProductSerializer


class ProductUpdateView(generics.UpdateAPIView):
    queryset            = Product.objects.all()
    serializer_class    = ProductCreateUpdateSerializer