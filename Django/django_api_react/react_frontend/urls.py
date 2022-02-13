from django.urls import path
from . import views

app_name = 'react_frontend'

urlpatterns = [
    path('', views.index),
]
