from django.contrib import admin

from myapp.models import Client, Skill, ParticularSkill, ProgrammingLanguage, Project, ProjectCategory

admin.site.register(Client)
admin.site.register(Skill)
admin.site.register(ParticularSkill)
admin.site.register(ProjectCategory)
admin.site.register(ProgrammingLanguage)
admin.site.register(Project)

admin.site.site_header = "DevJey Portfolio"
admin.site.site_title = "DevJey Portfolio"
