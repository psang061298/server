from django.shortcuts import render
from rest_framework import generics
from .models import Member
from .serializers import UserListSerializer, UserDetailSerializer
from django_filters.rest_framework import DjangoFilterBackend as BasicDjangoFilterBackend
from url_filter.integrations.drf import DjangoFilterBackend
from rest_framework import filters

# Create your views here.
class UserList(generics.ListCreateAPIView):
    queryset = Member.objects.all()
    serializer_class = UserListSerializer

    # filter theo tên thuộc tính:
    # filter_backends = [DjangoFilterBackend]
    # filterset_fields = ['email', 'address', 'phone']

    # search bất kỳ thuộc tính nào chứa dữ liệu như params
    filter_backends = [BasicDjangoFilterBackend, filters.SearchFilter, DjangoFilterBackend]
    filter_fields = ['email',]
    search_fields = ['email',]

    # def get_queryset(self):
    #     queryset = Member.objects.all()
    #     email = self.request.query_params.get('email', None)
    #     if email is not None:
    #         queryset = queryset.filter(email=email)
    #     return queryset

    def perform_create(self, serializer):
        serializer.save(active=True)

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Member.objects.all()
    serializer_class = UserDetailSerializer