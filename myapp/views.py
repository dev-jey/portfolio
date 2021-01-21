from django.shortcuts import render
from django.shortcuts import (
render
)

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
    return render(request, 'index.html')