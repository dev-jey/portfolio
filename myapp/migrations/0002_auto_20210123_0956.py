# Generated by Django 3.1.5 on 2021-01-23 09:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='project',
            old_name='challenge',
            new_name='description',
        ),
        migrations.RemoveField(
            model_name='project',
            name='conclusion',
        ),
        migrations.RemoveField(
            model_name='project',
            name='process',
        ),
    ]
