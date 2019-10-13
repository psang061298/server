# Generated by Django 2.2.4 on 2019-09-23 12:17

from django.db import migrations, models
import django_mysql.models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='images',
            field=django_mysql.models.ListTextField(models.CharField(max_length=255), default=0, size=30),
            preserve_default=False,
        ),
    ]