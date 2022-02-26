from django.core.management.base import BaseCommand
from django.utils.crypto import get_random_string

class Command(BaseCommand):
    help = 'Elon Musk baby name generator'
    def handle(self, *args, **kwargs):
        name = get_random_string(length=32)
        self.stdout.write(name)
        
