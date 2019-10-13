# Generated by Django 2.2.4 on 2019-10-13 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0003_auto_20191013_1527'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('waiting', 'waiting'), ('pending', 'pending'), ('shipping', 'shipping'), ('success', 'success'), ('canceled', 'canceled')], default='waiting', max_length=20, null=True),
        ),
    ]
