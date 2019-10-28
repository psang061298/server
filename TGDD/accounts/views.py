from django.shortcuts import render
from rest_framework import generics
from .models import Member
from .serializers import UserListSerializer, UserDetailSerializer
from django_filters.rest_framework import DjangoFilterBackend as BasicDjangoFilterBackend
from url_filter.integrations.drf import DjangoFilterBackend
from rest_framework import filters
from cart.models import Cart
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from django.core.exceptions import ObjectDoesNotExist
from django.http import Http404
from rest_framework import status
from .permissions import IsAdminOrOwner

# Create your views here.
class UserList(generics.ListCreateAPIView):
    queryset = Member.objects.all()
    serializer_class = UserListSerializer
    permission_classes = (IsAuthenticated,)

    filter_backends = [BasicDjangoFilterBackend, filters.SearchFilter, DjangoFilterBackend]
    filter_fields = ['email',]
    search_fields = ['email',]

    def get_queryset(self):
        if self.request.user.is_admin:
            return self.queryset.order_by('-id')
        return self.queryset.filter(email=self.request.user)


class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Member.objects.all()
    serializer_class = UserDetailSerializer
    permission_classes  = (IsAuthenticated,)

    # def get_object(self, pk):
    #     try:
    #         return self.queryset.get(pk=pk)
    #     except ObjectDoesNotExist:
    #         raise Http404

    # def get(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     serializer = UserListSerializer(user)
    #     return Response(serializer.data)

    # def put(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     serializer = UserDetailSerializer(user, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UserSignUp(generics.CreateAPIView):
    queryset = Member.objects.all()
    serializer_class = UserListSerializer