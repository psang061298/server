# Generated by Django 2.2.4 on 2019-11-12 12:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0008_cartitem_in_cart'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cartitem',
            name='in_cart',
            field=models.BooleanField(default=True, null=True),
        ),
    ]
