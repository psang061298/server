# Generated by Django 2.2.4 on 2019-09-28 13:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('brands', '0002_brand_logo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='brand',
            name='is_active',
            field=models.BooleanField(),
        ),
        migrations.AlterField(
            model_name='brand',
            name='name',
            field=models.CharField(max_length=20, unique=True),
        ),
    ]
