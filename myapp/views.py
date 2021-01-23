from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import (
render
)
from .models import Project, Skill, Specialty, Client

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


@csrf_exempt
def get_home(request):
    projects = Project.objects.all()
    skills = Skill.objects.all()
    clients = Client.objects.all()

    all_skills = []
    for skill in skills:
        specialties = []
        for specialty in Specialty.objects.all():
            print(skill.slug, specialty.parent_skill.slug)
            if specialty.parent_skill.slug == skill.slug:
                specialties.append(specialty)
        all_skills.append({
            'skill': skill,
            'specialties': specialties
        })

    return render(request, 'index.html', {'projects':projects, 'skills': all_skills, 'clients': clients})


@csrf_exempt
def get_portfolio(request):
    projects = Project.objects.all()
    skills = Skill.objects.all()
    return render(request, 'portfoliopage.html', {'projects':projects, 'skills':skills})

@csrf_exempt
def get_about(request):
    clients = Client.objects.all()
    return render(request, 'aboutpage.html', {'clients':clients})

@csrf_exempt
def get_contact(request):
    return render(request, 'contactpage.html')


@csrf_exempt
def get_services(request):
    return render(request, 'servicespage.html')


@csrf_exempt
def get_single_project(request, slug):
    return render(request, 'singleproject.html')