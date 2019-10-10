from upload.views import UploadView
from django.urls import path

urlpatterns = [
    path('', UploadView.as_view()),
]

