# Generated by Django 2.2.4 on 2019-09-23 18:56

from django.db import migrations, models
import django_mysql.models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0003_auto_20190924_0152'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='images',
            field=django_mysql.models.ListTextField(models.CharField(max_length=255), size=30),
        ),
    ]