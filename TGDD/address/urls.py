from django.urls import include, path
from django.conf.urls import url
from .views import AddressListView, AddressDetailView
from rest_framework import routers

urlpatterns = [
    path('', AddressListView.as_view()),
    path('<int:pk>/', AddressDetailView.as_view())
]
