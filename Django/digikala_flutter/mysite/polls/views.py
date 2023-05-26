from rest_framework import generics
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status





@api_view(['GET'])
def pageViewPic(request):
    photos = [
        {
            'id': 1,
            'imgurl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/1404cd6306252ff4f1ed8bbec908fc76031c8e72_1684920921.jpg?x-oss-process=image/quality,q_95/format,webp'
        },
        {
            'id': 2,
            'imgurl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/250d2c3ce84148dbf981598506e291e0a687bacb_1684581682.jpg?x-oss-process=image/quality,q_95/format,webp'
        },
        {
            'id': 3,
            'imgurl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/ed4bf0a28909fc805c79576d7b6b695a480249bb_1685046190.jpg?x-oss-process=image/quality,q_95/format,webp'
        },
        {
            'id': 4,
            'imgurl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/fe2491448fa82a761c8e01d3e77b73180f5c9bae_1681544141.jpg?x-oss-process=image/quality,q_95/format,webp'
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
            'imgUrl': 'https://asianini.ir/wp-content/uploads/2022/11/InShot_20221112_195201357-scaled.jpg'
        },
        {
            'id': 2,
            "productName": "کتاب قدرت ذهن",
            "price": 95000,
            "off_price": 32000,
            "off_precent": 60,
            'imgUrl': 'https://img.ketabrah.ir/img/l/4616201093981402.jpg'
        },
        {
            'id': 3,
            "productName": "کفش راحتی زنانه نسیم",
            "price": 185000,
            "off_price": 109000,
            "off_precent": 41,
            'imgUrl': 'https://dkstatics-public.digikala.com/digikala-products/f65408d6ff8d7463ffea49bc23029d7baf8f770e_1645942138.jpg?x-oss-process=image/resize,w_1600/quality,q_80'
        },
        {
            'id': 4,
            "productName": "محلول تقویت کننده مو",
            "price": 230000,
            "off_price": 110000,
            "off_precent": 52,
            'imgUrl': 'https://dkstatics-public.digikala.com/digikala-products/5395868.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90',
            #'imgUrl': 'https://rastinweb.com/wp-content/uploads/2021/04/A-complete-guide-to-choosing-the-best-product-for-online-sales.jpg'
        }
    ]

    response = {'product': product}
    return Response(status=status.HTTP_200_OK, data=response)

