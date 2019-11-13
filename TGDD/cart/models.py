from django.db import models
from accounts.models import Member
from products.models import Product
from order.models import Order


class Cart(models.Model):
    customer = models.OneToOneField(Member, on_delete=models.CASCADE, primary_key=True,)

    def __str__(self):
        return "Giỏ hàng của khách hàng %s" % self.customer.fullname

class CartItem(models.Model):
    product     = models.ForeignKey(Product, on_delete=models.CASCADE)
    cart        = models.ForeignKey(Cart, related_name='cart_items', on_delete=models.CASCADE)
    quantity    = models.PositiveIntegerField()
    final_price = models.FloatField(default=0, null=True)
    paid        = models.BooleanField(default=False, null=True)
    in_cart     = models.BooleanField(default=True, null=True)
    order       = models.ForeignKey(Order, related_name='products', on_delete=models.CASCADE, null=True)

    REQUIRED_FIELDS = ['product', 'quantity']

    def __str__(self):
        return "Sản phẩm %s có số lượng %s" % (self.product.name, self.quantity)