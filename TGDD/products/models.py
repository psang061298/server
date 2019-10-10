from django.db import models
from categories.models import Category
from brands.models import Brand
from jsonfield import JSONField
from django_mysql.models import ListTextField


class Product(models.Model):
    name            = models.CharField(max_length=100, unique=True)
    brand           = models.ForeignKey(Brand, related_name='brand_products', on_delete=models.CASCADE)
    description     = models.TextField(default='', null=True, blank=True)
    images          = ListTextField( base_field=models.CharField(max_length=255), size=30 )
    price           = models.FloatField()
    quantity        = models.PositiveIntegerField()
    is_active       = models.BooleanField(default=True)
    specifications  = JSONField()
    category        = models.ForeignKey(Category, related_name='products', on_delete=models.CASCADE)
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)

    REQUIRED_FIELDS = ['name', 'brand', 'price', 'quantity', 'category']

    def __str__(self):
        return self.name