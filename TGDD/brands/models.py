from django.db import models

# Create your models here.
class Brand (models.Model):
    name        = models.CharField(max_length=20, unique=True)
    country     = models.CharField(max_length=20, default='', null=True, blank=True)
    logo        = models.TextField(default='', null=True, blank=True)
    is_active   = models.BooleanField()
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at  = models.DateTimeField(auto_now=True)

    REQUIRED_FIELDS = ['name', 'is_active']

    def __str__(self):
        return self.name
        