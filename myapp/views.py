from django.shortcuts import render
from django.shortcuts import (
    render
)
from .models import Language, Project, Skill

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


def get_all_skills():
    return Skill.objects.all()


def get_all_projects():
    return Project.objects.all()


def get_all_languages():
    return Language.objects.all()


def get_home(request):
    projects = get_all_projects()
    featured_project = projects.filter(featured=True).first()
    all_skills = get_all_skills()
    return render(request, 'index.html', {'projects': projects, 'skills': all_skills, 'featured_project': featured_project})


def get_portfolio(request):
    projects = get_all_projects()
    skills = get_all_skills()
    languages = get_all_languages()
    return render(request, 'portfoliopage.html', {'projects': projects, 'skills': skills, 'languages': languages})


def get_about(request):
    projects = get_all_projects()
    featured_project = projects.filter(featured=True).first()
    return render(request, 'aboutpage.html', {'featured_project': featured_project, 'projects': projects})


def get_contact(request):
    return render(request, 'contactpage.html')


def get_services(request):
    skills = get_all_skills()
    return render(request, 'servicespage.html', {'skills': skills})


def get_single_project(request, slug):
    project = get_all_projects().filter(slug=slug).first()
    return render(request, 'singleproject.html', {'project': project})
