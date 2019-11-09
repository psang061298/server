from django.shortcuts import render
from .models import Category
from .serializers import CategorySerializer, CategoryDetailSerializer
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.permissions import IsAdminUser
from .permissions import IsAdminOrReadOnly


class CategoryList(generics.ListCreateAPIView):
    queryset            = Category.objects.all()
    serializer_class    = CategorySerializer
    permission_classes  = (IsAdminOrReadOnly,)

    def get_queryset(self):
        if self.request.user.is_authenticated:
            if self.request.user.is_admin:
                return self.queryset.all().order_by('-id')
        return self.queryset.filter(is_active=True)

    def list (self, request):
        if not request.user.is_anonymous:
            if request.user.is_admin:
                queryset = self.queryset.all()
                serializer = CategorySerializer(queryset, many=True)
                return Response(data=serializer.data)
        queryset    = self.get_queryset()
        serializer  = CategorySerializer(queryset, many=True)
        return Response(data=serializer.data)


class CategoryDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset            = Category.objects.all()
    serializer_class    = CategoryDetailSerializer
    permission_classes  = (IsAdminUser,)