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

    # def create(self, request, *args, **kwargs):
    #     cate = Category(created_at=timezone.now(), updated_at=timezone.now())
    #     serializer = self.serializer_class(cate, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     else:
    #         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CategoryDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Category.objects.all()
    serializer_class    = CategoryDetailSerializer