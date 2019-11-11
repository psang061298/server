from django.shortcuts import render
from .models import Promotion
from categories.models import Category
from .serializers import PromotionSerializer, PromotionCreateUpdateSerializer
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import IsAdminUser
from datetime import date
from django.http import Http404


class PromotionListView(generics.ListCreateAPIView):
    queryset            = Promotion.objects.all()
    serializer_class    = PromotionSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated:
            if self.request.user.is_admin:
                return self.queryset.all().order_by('-id')
        return self.queryset.filter(start_date__lte= date.today(), end_date__gt= date.today()).order_by('-id')

    def post (self, request):
        serializer = PromotionCreateUpdateSerializer(data=request.data, context={'request': request})
        if request.user.is_anonymous:
            return Response('You have not logged in!', status=status.HTTP_400_BAD_REQUEST)
        else:
            if not request.user.is_admin:
                return Response('Only the admin user can perform this action!', status=status.HTTP_400_BAD_REQUEST)
            else:
                if serializer.is_valid():
                    cate            = Category.objects.get(pk=request.data['category'])
                    start_day_str   = request.data['start_date']
                    end_day_str     = request.data['end_date']
                    start_date      = date(int(start_day_str[6:10]), int(start_day_str[3:5]), int(start_day_str[0:2]))
                    end_date        = date(int(end_day_str[6:10]), int(end_day_str[3:5]), int(end_day_str[0:2]))
                    if start_date < date.today():
                        return Response('Invalid start date! Start date must be today or later.', status=status.HTTP_400_BAD_REQUEST)
                    if start_date >= end_date:
                        return Response('Invalid end date! End date must be greater than start date.', status=status.HTTP_400_BAD_REQUEST)

                    promotions = Promotion.objects.filter(category=cate)
                    for promotion in promotions:
                        if promotion.start_date <= start_date and start_date < promotion.end_date:
                          return Response("Duplicated promotion for that category at a time!", status=status.HTTP_400_BAD_REQUEST)

                    serializer.save()
                    return Response(serializer.data, status=status.HTTP_201_CREATED)
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

    def get_object(self, pk):
        try:
            return Promotion.objects.get(pk=pk)
        except:
            raise Http404

    def put(self, request, pk, format=None):
        order       = self.get_object(pk)
        serializer  = PromotionCreateUpdateSerializer(order, data=request.data)
        if serializer.is_valid():
            start_day_str   = request.data['start_date']
            end_day_str     = request.data['end_date']
            start_date      = date(int(start_day_str[6:10]), int(start_day_str[3:5]), int(start_day_str[0:2]))
            end_date        = date(int(end_day_str[6:10]), int(end_day_str[3:5]), int(end_day_str[0:2]))
            if start_date >= end_date:
                return Response('Invalid end date! End date must be greater than start date.', status=status.HTTP_400_BAD_REQUEST)
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)