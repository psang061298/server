# Generated by Django 2.2.4 on 2019-09-28 13:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('categories', '0005_auto_20190928_2023'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='image',
            field=models.TextField(blank=True, default='', null=True),
        ),
    ]
