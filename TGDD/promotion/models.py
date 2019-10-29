from django.db import models
from categories.models import Category

# Create your models here.
class Promotion (models.Model):
    title       = models.CharField(max_length=255, default='', null=True, blank=True)
    category    = models.ForeignKey(Category, related_name='promotions', on_delete=models.CASCADE)
    percent     = models.PositiveIntegerField()
    start_date  = models.DateField()
    end_date    = models.DateField()
    description = models.CharField(max_length=255, default='', null=True, blank=True)
    image       = models.TextField(default='', null=True, blank=True)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at  = models.DateTimeField(auto_now=True)

    REQUIRED_FIELDS = ['title', 'category', 'percent', 'start_date', 'end_date']

    def __str__(self):
        return self.title