from rest_framework import generics
from .serializers import LeadSerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .models import Events


class LeadListCreate(generics.ListCreateAPIView):
    queryset = Events.objects.all()
    serializer_class = LeadSerializer


@api_view(['GET', 'POST'])
def pageViewPic(request):
    print("pageViewPic")
    photos = [
        {
            'id': 1,
            'imgurl': 'https://www.ever247.cloud/wp-content/uploads/2018/06/inrenetshop.jpg'
        },
        {
            'id': 2,
            'imgurl': 'https://haftsetare.com/Content/images/867/news/crop/145274/dh-website-builders-6-750x498.jpg'
        },
        {
            'id': 3,
            'imgurl': 'https://haftsetare.com/Content/images/867/news/crop/140802/woocommerce-alternatives.jpg'
        },
        {
            'id': 4,
            'imgurl': 'https://rastinweb.com/wp-content/uploads/2021/04/A-complete-guide-to-choosing-the-best-product-for-online-sales.jpg'
        },
    ]

    response = {'photos': photos}
    return Response(status=status.HTTP_200_OK, data=response)
