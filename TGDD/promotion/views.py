from django.shortcuts import render
from .models import Promotion
from categories.models import Category
from .serializers import PromotionSerializer, PromotionCreateUpdateSerializer
from rest_framework import generics, status
from rest_framework.response import Response


class PromotionListView(generics.ListCreateAPIView):
    queryset            = Promotion.objects.all()
    serializer_class    = PromotionSerializer

    def post (self, request):
        serializer = PromotionCreateUpdateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PromotionDetailView(generics.RetrieveDestroyAPIView):
    queryset            = Promotion.objects.all()
    serializer_class    = PromotionSerializer


class PromotionUpdatelView(generics.UpdateAPIView):
    queryset            = Promotion.objects.all()
    serializer_class    = PromotionCreateUpdateSerializer