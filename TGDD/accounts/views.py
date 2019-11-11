from django.shortcuts import render
from rest_framework import generics
from .models import Member
from .serializers import UserListSerializer, UserDetailSerializer, UserProfilePuttingSerializer
from django_filters.rest_framework import DjangoFilterBackend as BasicDjangoFilterBackend
from url_filter.integrations.drf import DjangoFilterBackend
from rest_framework import filters
from cart.models import Cart
from rest_framework.permissions import IsAuthenticated, AllowAny, IsAdminUser
from rest_framework.response import Response
from django.core.exceptions import ObjectDoesNotExist
from django.http import Http404
from rest_framework import status
from .permissions import IsAdminOrOwner
from django.shortcuts import get_object_or_404

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
    permission_classes  = (IsAdminUser,)

class UserSignUp(generics.CreateAPIView):
    queryset = Member.objects.all()
    serializer_class = UserListSerializer

class ProfileView(generics.RetrieveUpdateAPIView):
    queryset = Member.objects.all()
    serializer_class = UserDetailSerializer
    permission_classes  = (IsAuthenticated,)

    def get_object(self, pk):
        try:
            return self.queryset.get(pk=pk)
        except:
            raise Http404

    def get(self, request, format=None):
        user = self.get_object(request.user.id)
        serializer = UserListSerializer(user)
        return Response(serializer.data)

    def put(self, request, format=None):
        user = self.get_object(request.user.id)
        serializer = UserProfilePuttingSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class PasswordChangingView(generics.UpdateAPIView):
    queryset = Member.objects.all()
    serializer_class = UserDetailSerializer
    permission_classes  = (IsAuthenticated,)
    
    def patch(self, request, format=None):
        if request.data['password'] is None or request.data['password'] == "":
            return Response("Password is required!", status=status.HTTP_400_BAD_REQUEST)
        user = get_object_or_404(self.queryset.all(), pk=int(request.user.id))
        serializer = UserDetailSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save(active=True)
            return Response(data=serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)