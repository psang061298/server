# Generated by Django 2.2.4 on 2019-10-06 08:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0006_auto_20191005_1808'),
    ]

    operations = [
        migrations.AlterField(
            model_name='member',
            name='avatar',
            field=models.CharField(blank=True, default='', max_length=255, null=True),
        ),
    ]
