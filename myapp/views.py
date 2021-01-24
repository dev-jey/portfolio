from django.shortcuts import render
from django.shortcuts import (
render
)
from .models import Project, Skill, Specialty, Client, ProjectTechnology

# HTTP Error 400
def bad_request(request, *args, **kwargs):
    response = render(
        request,
        '400.html'
        )

    response.status_code = 400

    return response

# HTTP Error 500
def server_error(request, *args, **kwargs):
    response = render(
        request,
        '500.html'
        )

    response.status_code = 500

    return response

# HTTP Error 404
def page_not_found(request, *args, **kwargs):
    response = render(
        request,
        '404.html'
        )

    response.status_code = 404

    return response


# HTTP Error 403
def permission_denied(request, *args, **kwargs):
    response = render(
        request,
        '403.html'
        )

    response.status_code = 403

    return response


def get_home(request):
    projects = Project.objects.all()
    featured_project = projects.filter(featured=True).first()
    clients = Client.objects.all()
    all_skills = get_all_skills()
    return render(request, 'index.html', {'projects':projects, 'skills': all_skills, 'clients': clients, 'featured_project':featured_project})


def get_all_skills():
    skills = Skill.objects.all()

    all_skills = []
    for skill in skills:
        specialties = []
        for specialty in Specialty.objects.all():
            if specialty.parent_skill.slug == skill.slug:
                specialties.append(specialty)
        all_skills.append({
            'skill': skill,
            'specialties': specialties
        })
    return all_skills


def get_portfolio(request):
    projects = Project.objects.all()
    skills = Skill.objects.all()
    return render(request, 'portfoliopage.html', {'projects':projects, 'skills':skills})

def get_about(request):
    clients = Client.objects.all()
    projects = Project.objects.all()
    featured_project = Project.objects.filter(featured=True).first()
    return render(request, 'aboutpage.html', {'clients':clients, 'featured_project':featured_project, 'projects':projects})

def get_contact(request):
    return render(request, 'contactpage.html')


def get_services(request):
    skills = get_all_skills()
    return render(request, 'servicespage.html', {'skills': skills})


def get_single_project(request, slug):
    project = Project.objects.filter(slug=slug).first()
    technologies = []
    for tech in ProjectTechnology.objects.all():
        if tech.parent_project.slug == slug:
            technologies.append(tech)
    return render(request, 'singleproject.html', {'project':project, 'technologies':technologies})