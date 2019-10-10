from django.shortcuts import render
from .models import Order
from .serializers import OrderSerializer, OrderCreateUpdateSerializer
from rest_framework import generics, status
from rest_framework import filters
from rest_framework.response import Response


class OrderListView(generics.ListCreateAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderSerializer

    def get_queryset(self):
        return self.queryset.order_by('-id')

    def post (self, request):
        serializer = OrderCreateUpdateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class OrderDetailView(generics.RetrieveDestroyAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderSerializer


class OrderUpdateView(generics.UpdateAPIView):
    queryset            = Order.objects.all()
    serializer_class    = OrderCreateUpdateSerializer