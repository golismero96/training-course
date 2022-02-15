from rest_framework import generics
from .serializers import LeadSerializer
from .models import Events


class LeadListCreate(generics.ListCreateAPIView):
    queryset = Events.objects.all()
    serializer_class = LeadSerializer
