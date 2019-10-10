from django.urls import include, path
from django.conf.urls import url
from .views import PromotionListView, PromotionDetailView, PromotionUpdatelView

urlpatterns = [
    path('', PromotionListView.as_view()),
    path('<int:pk>/', PromotionDetailView.as_view()),
    path('<int:pk>/update/', PromotionUpdatelView.as_view())
]