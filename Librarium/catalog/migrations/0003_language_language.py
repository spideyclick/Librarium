# Generated by Django 3.0.4 on 2020-03-19 22:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0002_language'),
    ]

    operations = [
        migrations.AddField(
            model_name='language',
            name='language',
            field=models.CharField(default='en', help_text='Enter a language', max_length=50),
            preserve_default=False,
        ),
    ]
