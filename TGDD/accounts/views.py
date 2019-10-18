from django.shortcuts import render
from rest_framework import generics
from .models import Member
from .serializers import UserListSerializer, UserDetailSerializer
from django_filters.rest_framework import DjangoFilterBackend as BasicDjangoFilterBackend
from url_filter.integrations.drf import DjangoFilterBackend
from rest_framework import filters
from cart.models import Cart

# Create your views here.
class UserList(generics.ListCreateAPIView):
    queryset = Member.objects.all()
    serializer_class = UserListSerializer

    filter_backends = [BasicDjangoFilterBackend, filters.SearchFilter, DjangoFilterBackend]
    filter_fields = ['email',]
    search_fields = ['email',]

    def get_queryset(self):
        return self.queryset.order_by('-id')

    # def perform_create(self, serializer):

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Member.objects.all()
    serializer_class = UserDetailSerializer