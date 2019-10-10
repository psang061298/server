from django.urls import include, path
from django.conf.urls import url
from .views import CategoryList, CategoryDetail
from rest_framework import routers

urlpatterns = [
    path('', CategoryList.as_view()),
    path('<int:pk>/', CategoryDetail.as_view())
]