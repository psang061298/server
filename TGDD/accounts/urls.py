from django.urls import include, path
from .views import UserList, UserDetail, UserSignUp, ProfileView, PasswordChangingView

urlpatterns = [
    path('', UserList.as_view()),
    path('<int:pk>/', UserDetail.as_view()),
    path('signup/', UserSignUp.as_view()),
    path('profile/', ProfileView.as_view()),
    path('password/', PasswordChangingView.as_view()),
]
