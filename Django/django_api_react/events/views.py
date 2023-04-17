from rest_framework import generics
from .serializers import LeadSerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .models import Events


class LeadListCreate(generics.ListCreateAPIView):
    queryset = Events.objects.all()
    serializer_class = LeadSerializer


@api_view(['GET'])
def pageViewPic(request):
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


@api_view(['GET'])
def specialOffer(request):
    product = [
        {
            'id': 1,
            "productName": "شلوار بچه گانه",
            "price": 115000,
            "off_price": 49000,
            "off_precent": 40,
            'imgUrl': 'https://www.ever247.cloud/wp-content/uploads/2018/06/inrenetshop.jpg'
        },
        {
            'id': 2,
            "productName": "کتاب قدرت ذهن",
            "price": 95000,
            "off_price": 32000,
            "off_precent": 60,
            'imgUrl': 'https://haftsetare.com/Content/images/867/news/crop/145274/dh-website-builders-6-750x498.jpg'
        },
        {
            'id': 3,
            "productName": "کفش راحتی زنانه نسیم",
            "price": 185000,
            "off_price": 109000,
            "off_precent": 41,
            'imgUrl': 'https://haftsetare.com/Content/images/867/news/crop/140802/woocommerce-alternatives.jpg'
        },
        {
            'id': 4,
            "productName": "محلول تقویت کننده مو",
            "price": 230000,
            "off_price": 110000,
            "off_precent": 52,
            'imgUrl': 'https://rastinweb.com/wp-content/uploads/2021/04/A-complete-guide-to-choosing-the-best-product-for-online-sales.jpg'
        }
    ]

    response = {'product': product}
    return Response(status=status.HTTP_200_OK, data=response)
