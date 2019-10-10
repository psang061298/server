from django.db import models
from accounts.models import Member
from model_utils import Choices


class Order(models.Model):
    _choices            = Choices('waiting', 'pending', 'success')
    status              = models.CharField(max_length=20, null=True, choices=_choices, default='waiting')
    total_price         = models.FloatField()
    receiver_name       = models.CharField(max_length=100)
    receiver_address    = models.CharField(max_length=255)
    receiver_phone      = models.CharField(max_length=20)
    description         = models.CharField(max_length=255, null=True, blank=True)
    token               = models.TextField(null=True, blank=True)
    buyer               = models.ForeignKey(Member, on_delete=models.CASCADE)
    ordered_at          = models.DateTimeField(auto_now_add=True)
    updated_at          = models.DateTimeField(auto_now=True)

    REQUIRED_FIELDS = ['total_price', 'receiver_name', 'receiver_address', 'receiver_phone']

    def __str__(self):
        return self.buyer