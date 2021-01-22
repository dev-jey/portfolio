# Generated by Django 3.1.5 on 2021-01-22 19:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_auto_20210122_0839'),
    ]

    operations = [
        migrations.CreateModel(
            name='Specialty',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('created_at', models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.AddField(
            model_name='skill',
            name='icon',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.DeleteModel(
            name='ParticularSkill',
        ),
        migrations.AddField(
            model_name='specialty',
            name='parent_skill',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='specialty', to='myapp.skill'),
        ),
    ]
