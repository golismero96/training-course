from django.urls import path
from . import views

app_name = 'events'

urlpatterns = [
    path('events/api/', views.LeadListCreate.as_view()),
    path('pageViewPics/', views.pageViewPic),
    path('specialOffer/', views.specialOffer),
]
