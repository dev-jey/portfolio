# Generated by Django 3.1.5 on 2021-01-22 08:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Clients',
            new_name='Client',
        ),
        migrations.RenameModel(
            old_name='ParticularSkills',
            new_name='ParticularSkill',
        ),
        migrations.RenameModel(
            old_name='ProgrammingLanguages',
            new_name='ProgrammingLanguage',
        ),
        migrations.RenameModel(
            old_name='Skills',
            new_name='Skill',
        ),
    ]