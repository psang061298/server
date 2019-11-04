from django.db import models
from accounts.models import Member

# Create your models here.
class Address (models.Model):
    fullname    = models.CharField(max_length=100)
    address     = models.TextField()
    phone       = models.CharField(max_length=20)
    member      = models.ForeignKey(Member, related_name='addresses', on_delete=models.CASCADE)

    REQUIRED_FIELDS = ['fullname', 'address', 'phone']

    def __str__(self):
        return self.address
        