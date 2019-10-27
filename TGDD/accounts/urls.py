from django.urls import include, path
from .views import UserList, UserDetail, UserSignUp

urlpatterns = [
    path('', UserList.as_view()),
    path('<int:pk>/', UserDetail.as_view()),
    path('signup/', UserSignUp.as_view()),
]
