from django.urls import include, path
from django.conf.urls import url
from .views import OrderListView, OrderDetailView, OrderUpdateView

urlpatterns = [
    path('', OrderListView.as_view()),
    path('<int:pk>/', OrderDetailView.as_view()),
    path('<int:pk>/update/', OrderUpdateView.as_view())
]