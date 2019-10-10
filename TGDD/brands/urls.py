from django.urls import include, path
from django.conf.urls import url
from .views import BrandListView, BrandDetailView
from rest_framework import routers

urlpatterns = [
    path('', BrandListView.as_view()),
    path('<int:pk>/', BrandDetailView.as_view())
]
