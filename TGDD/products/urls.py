from django.urls import include, path
from django.conf.urls import url
from .views import ProductListView, ProductDetailView, ProductUpdateView

urlpatterns = [
    path('', ProductListView.as_view()),
    path('<int:pk>/', ProductDetailView.as_view()),
    path('<int:pk>/update/', ProductUpdateView.as_view())
]