# Generated by Django 3.0.4 on 2020-03-21 20:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0006_bookinstance_borrower'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='bookinstance',
            options={'ordering': ['due_back'], 'permissions': (('can_mark_returned', 'Set book as returned'),)},
        ),
    ]
