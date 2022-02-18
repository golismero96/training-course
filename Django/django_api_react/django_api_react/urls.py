from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('allauth.urls')),
    path('', include('events.urls', namespace='events')),
    path('', include('react_frontend.urls', namespace='react_frontend')),
]
