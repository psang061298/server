from django.shortcuts import render
from .models import Promotion
from categories.models import Category
from .serializers import PromotionSerializer, PromotionCreateUpdateSerializer
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import IsAdminUser
from datetime import date


class PromotionListView(generics.ListCreateAPIView):
    queryset            = Promotion.objects.all()
    serializer_class    = PromotionSerializer

    def get_queryset(self):
        return self.queryset.order_by('-id')

    def post (self, request):
        serializer = PromotionCreateUpdateSerializer(data=request.data, context={'request': request})
        if request.user.is_anonymous:
            return Response('You have not logged in!', status=status.HTTP_400_BAD_REQUEST)
        else:
            if not request.user.is_admin:
                return Response('Only the admin user can perform this action!', status=status.HTTP_400_BAD_REQUEST)
            else:
                if serializer.is_valid():
                    pk = serializer.data['category']
                    promotion = Promotion.objects.get(pk=pk, start_date<=date.today(), end_date>date.today())
                    if promotion != None:
                        return Response("Duplicated available promotion for the category number "+request.data['category']+" at a time!", status=status.HTTP_400_BAD_REQUEST)
                    # serializer.save()
                    return Response(serializer.data['category'], status=status.HTTP_201_CREATED)
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PromotionDetailView(generics.RetrieveDestroyAPIView):
    queryset            = Promotion.objects.all()
    serializer_class    = PromotionSerializer

    def delete(self, request, pk, format=None):
        if request.user.is_anonymous:
            return Response('You have not logged in!', status=status.HTTP_400_BAD_REQUEST)
        else:
            if not request.user.is_admin:
                return Response('Only the admin user can perform this action!', status=status.HTTP_400_BAD_REQUEST)
            else:
                promotion = Promotion.objects.get(pk=pk)
                promotion.delete()
                return Response(status=status.HTTP_204_NO_CONTENT)


class PromotionUpdatelView(generics.UpdateAPIView):
    queryset            = Promotion.objects.all()
    serializer_class    = PromotionCreateUpdateSerializer
    permission_classes  = (IsAdminUser,)