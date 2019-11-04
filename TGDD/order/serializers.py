from rest_framework import serializers
from .models import Order
import stripe
from TGDD.settings import STRIPE_SECRET_KEY


class OrderSerializer (serializers.ModelSerializer):
    ordered_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Order
        fields  = ['id', 'status', 'total_price', 'shipping_address', 'bill_address', 'description', 'token', 'buyer', 'ordered_at', 'updated_at']
        depth   = 1

    # def create(self, validated_data):
    #     stripe.api_key = STRIPE_SECRET_KEY

    #     stripe_customer = stripe.Customer.create(
    #         card = request.data['token'],
    #         description = Member.objects.get(pk = request.data['buyer']['fullname'])
    #     )

    #     charge = stripe.Charge.create (
    #         amount = request.data['total_price'],
    #         currency='usd',
    #         description = request.data['description'],
    #         customer=stripe_customer,
    #     )

class OrderCreateUpdateSerializer (serializers.ModelSerializer):
    ordered_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    class Meta:
        model   = Order
        fields  = ['id', 'status', 'total_price', 'shipping_address', 'bill_address', 'description', 'token', 'buyer', 'ordered_at', 'updated_at']
        # read_only_fields = ('buyer',)