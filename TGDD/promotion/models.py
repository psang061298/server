from django.db import models
from categories.models import Category

# Create your models here.
class Promotion (models.Model):
    category    = models.ForeignKey(Category, related_name='promotions', on_delete=models.CASCADE)
    percent     = models.PositiveIntegerField()
    start_date  = models.DateField()
    end_date    = models.DateField()
    image       = models.TextField(default='', null=True, blank=True)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at  = models.DateTimeField(auto_now=True)

    REQUIRED_FIELDS = ['title', 'category', 'percent', 'start_date', 'end_date']

    def __str__(self):
        return "Khuyến mãi áp dụng cho %s từ %s đến %s" % (self.category.title, self.start_date, self.end_date)