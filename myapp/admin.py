from django.contrib import admin
from django_better_admin_arrayfield.admin.mixins import DynamicArrayMixin
from myapp.models import Skill, Project, Language


class SkillAdmin(admin.ModelAdmin, DynamicArrayMixin):
    """Define custom model display for skills on admin dashboard."""

    earch_fields = ('title',)
    list_display = ("title", "specialties", "percentage",
                    "icon", "description", "created_at")


class LanguageAdmin(admin.ModelAdmin):
    """Define custom model display for skills on admin dashboard."""

    earch_fields = ('title',)
    list_display = ("title", "description", "created_at")


class ProjectAdmin(admin.ModelAdmin, DynamicArrayMixin):
    """Define custom model display for projects on admin dashboard."""

    earch_fields = ('title',)
    list_display = ("title", "description", "featured", "languages",
                    "bg_image_tag", "cover_image_tag", "project_technologies",
                    "created_at")


admin.site.register(Skill, SkillAdmin)
admin.site.register(Project, ProjectAdmin)
admin.site.register(Language, LanguageAdmin)

admin.site.site_header = "DevJey Portfolio"
admin.site.site_title = "DevJey Portfolio"
