from django.urls import path
from . import views

app_name = 'events'

urlpatterns = [
    path('pageViewPics/', views.pageViewPic),
    path('specialOffer/', views.specialOffer),
]
