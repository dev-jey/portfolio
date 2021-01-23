from django.db import models
from cloudinary.models import CloudinaryField
import os
from django.db.models.signals import pre_delete
from django.dispatch import receiver
from tinymce.models import HTMLField
from django.db.models.signals import post_save
from django.utils.text import slugify
import cloudinary


class Client(models.Model):
    title = models.CharField(max_length=100)
    image = CloudinaryField('image',folder='portfolio/clients')
    created_at = models.DateField(auto_now_add=True)


    def __str__(self):
        return self.title
    
    @property
    def cloudinary_image(self):
        return f"https://res.cloudinary.com/{os.environ.get('CLOUD_NAME', '')}/{self.image}"


@receiver(pre_delete, sender=Client)
def photo_delete(sender, instance, **kwargs):
    cloudinary.uploader.destroy(instance.image.public_id)


class Skill(models.Model):
    title = models.CharField(max_length=100)
    percentage = models.CharField(max_length=100, default='0')
    image = CloudinaryField('image',folder='portfolio/skills')
    icon = models.CharField(max_length=100, null=True)
    slug = models.SlugField(db_index=True, max_length=1000,
                            editable=False,
                            unique=True, blank=True, primary_key=True)
    description = HTMLField()
    created_at = models.DateField(auto_now_add=True)


    def __str__(self):
        return self.title

    
    @property
    def cloudinary_image(self):
        return f"https://res.cloudinary.com/{os.environ.get('CLOUD_NAME', '')}/{self.image}"

    
    def generate_slug(self):
        """generating a slug for the title of the project
            eg: this-is-an-project"""
        slug = slugify(self.title)
        new_slug = slug
        s = 1
        while Skill.objects.filter(slug=new_slug).exists():
            """increase value of slug by one"""
            new_slug = f'{slug}-{s}'
            s += 1
        return new_slug

    def save(self, *args, **kwargs):
        """create a project and save to the database"""
        if not self.slug:
            self.slug = self.generate_slug()
        super(Skill, self).save(*args, **kwargs)
    
def update_slug(sender,instance, signal, **kwargs):
    '''Signal to update an project's slug once title is updated''' 
    if kwargs.get('updated', True):
        skill = Skill.objects.filter(slug=instance.pk)
        new_slug = slugify(instance.title)
        skill.update(
            slug=new_slug
        )
    

@receiver(pre_delete, sender=Skill)
def photo_delete(sender, instance, **kwargs):
    cloudinary.uploader.destroy(instance.image.public_id)


class Specialty(models.Model):
    parent_skill = models.ForeignKey(Skill, related_name='specialty',
                                 on_delete=models.CASCADE,
                                 blank=True, null=True)
    title = models.CharField(max_length=100)
    created_at = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title




class Project(models.Model):
    title = models.CharField(max_length=100)
    description = HTMLField()
    featured = models.BooleanField(default=False)
    cover_image = CloudinaryField('image',folder='portfolio/project/cover')
    bg_image = CloudinaryField('image',folder='portfolio/project/background')
    skill = models.ForeignKey(Skill, related_name='project_role',
                                 on_delete=models.CASCADE,
                                 blank=False, null=False)
    slug = models.SlugField(db_index=True, max_length=1000, default='',
                            editable=False,
                            unique=True, blank=True, primary_key=True)
    start_date = models.DateField()
    end_date = models.DateField()
    website = models.CharField(max_length=100)
    github = models.CharField(max_length=100)
    created_at = models.DateField(auto_now_add=True)


    @property
    def my_cover_image(self):
        return f"https://res.cloudinary.com/{os.environ.get('CLOUD_NAME', '')}/{self.cover_image}"

    @property
    def my_bg_image(self):
        return f"https://res.cloudinary.com/{os.environ.get('CLOUD_NAME', '')}/{self.bg_image}"


    class Meta:
        '''Defines the ordering of the
         projects if retrieved'''
        ordering = ('title',)

    def __str__(self):
        return self.title

    def generate_slug(self):
        """generating a slug for the title of the project
            eg: this-is-an-project"""
        slug = slugify(self.title)
        new_slug = slug
        s = 1
        while Project.objects.filter(slug=new_slug).exists():
            """increase value of slug by one"""
            new_slug = f'{slug}-{s}'
            s += 1
        return new_slug

    def save(self, *args, **kwargs):
        """create a project and save to the database"""
        if not self.slug:
            self.slug = self.generate_slug()
        super(Project, self).save(*args, **kwargs)
    
def update_slug(sender,instance, signal, **kwargs):
    '''Signal to update an project's slug once title is updated''' 
    if kwargs.get('updated', True):
        project = Project.objects.filter(slug=instance.pk)
        new_slug = slugify(instance.title)
        project.update(
            slug=new_slug
        )

@receiver(pre_delete, sender=Project)
def photo_delete(sender, instance, **kwargs):
    cloudinary.uploader.destroy(instance.image.public_id)



class ProjectTechnology(models.Model):
    parent_project= models.ForeignKey(Project, related_name='technology',
                                 on_delete=models.CASCADE,
                                 blank=True, null=True)
    title = models.CharField(max_length=100)
    created_at = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title