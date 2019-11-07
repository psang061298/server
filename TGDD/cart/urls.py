from django.urls import include, path
from django.conf.urls import url
from .views import CartListView, CartItemListView, CartItemDetailView, CartItemStatistics
from rest_framework import routers


urlpatterns = [
    path('', CartListView.as_view()),
    # path('<int:pk>/', CartDetailView.as_view()),
    path('items/', CartItemListView.as_view()),
    path('items/<int:pk>/', CartItemDetailView.as_view())
]