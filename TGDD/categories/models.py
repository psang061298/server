from django.db import models

# Create your models here.
class Category (models.Model):
    title       = models.CharField(max_length=50, unique=True)
    image       = models.TextField(default='', null=True, blank=True)
    is_active   = models.BooleanField()
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at  = models.DateTimeField(auto_now=True)

    REQUIRED_FIELDS = ['title', 'is_active']

    def __str__(self):
        return self.title