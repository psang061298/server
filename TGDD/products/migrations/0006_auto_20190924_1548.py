# Generated by Django 2.2.4 on 2019-09-24 08:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0005_auto_20190924_1546'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='specifications',
            field=models.TextField(default='', null=True),
        ),
    ]
