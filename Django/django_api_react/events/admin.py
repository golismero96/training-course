from django.contrib import admin
from .models import Events


class EventsAdmin(admin.ModelAdmin):
    list_display = ('title', 'details')


admin.site.register(Events, EventsAdmin)
