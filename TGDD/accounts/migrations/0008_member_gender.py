# Generated by Django 2.2.4 on 2019-10-24 10:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0007_auto_20191006_1550'),
    ]

    operations = [
        migrations.AddField(
            model_name='member',
            name='gender',
            field=models.CharField(blank=True, choices=[('male', 'male'), ('female', 'female')], default='male', max_length=6, null=True),
        ),
    ]
