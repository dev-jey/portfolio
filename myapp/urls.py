from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from django.shortcuts import redirect

urlpatterns = [
    path('', views.get_home, name='home'),
    path('about/', views.get_about, name='about'),
    path('services/', views.get_services, name='services'),
    path('portfolio/', views.get_portfolio, name='portfolio'),
    path('contact/', views.get_contact, name='contact'),
    path('portfolio/<slug>/', views.get_single_project, name='single-project'),
]
