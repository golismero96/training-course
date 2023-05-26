from rest_framework import generics
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status

@api_view(['GET'])
def VenturesRender(request):
    ventures = [
	{
        	'text': 'دیجی‌کالا جت',
        	'imgurl': 'https://dkstatics-public.digikala.com/digikala-bellatrix/d0dc31c892be8cf1408e4e14580b3f479da66bd1_1648897133.png',
	},
	{
        	'text': 'حراج استایل',
	        'imgurl': 'https://dkstatics-public.digikala.com/digikala-bellatrix/625d8883f37944f3f0c4af5fe39435600931ab22_1664309850.png',
      	},
      	{
        	'text': 'خرید اقساطی',
	        'imgurl': 'https://dkstatics-public.digikala.com/digikala-bellatrix/ac127167132653d14c758748b07824a6a7643a31_1663444619.png',
      	},
      	{
        	'text': 'دیجی‌کالا سرویس',
	        'imgurl': 'https://dkstatics-public.digikala.com/digikala-bellatrix/555ad3336a60bbd1433dd7a999f4d487e96602d8_1680678388.png',
      	},
      	{
        	'text': 'لاکی باکس',
	        'imgurl': 'https://dkstatics-public.digikala.com/digikala-bellatrix/d3ef1e7e6dd2189d4c1468c8998b24b4ec5bcc45_1683402274.png',
      	},
      	{
        	'text': 'خرید سر ماه',
	        'imgurl': 'https://dkstatics-public.digikala.com/digikala-bellatrix/269766a358cf34e58ccaf49aa3ac2d2db397af7a_1661223821.png',
      	},
     	{
        	'text': 'لاکی باکس',
	        'imgurl': 'https://dkstatics-public.digikala.com/digikala-bellatrix/78ccd40cbf305fb067de78ddab5be84f69589c8d_1648897009.png',
      	},
    ]

    response = {'ventures': ventures}
    return Response(status=status.HTTP_200_OK, data=response)

@api_view(['GET'])
def EventsPage(request):
    products = [
        {
            'imgUrl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/9ee9d49fb91c875ca390d29d45decd25d7d1097b_1679745917.jpg?x-oss-process=image/quality,q_95/format,webp'
        },
        {
            'imgUrl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/aee8d02a9e65719d69f87ee705938427c3f6cf1e_1681797338.jpg?x-oss-process=image/quality,q_95/format,webp'
        },
        {
            'imgUrl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/f803a641ab27536c2665697fcd622408bf9161e2_1684697918.jpg?x-oss-process=image/quality,q_95/format,webp'
        },
        {
            'imgUrl': 'https://dkstatics-public.digikala.com/digikala-adservice-banners/3056952e59f2e85aa1cad27d79b2f7b060d20bb0_1675849450.jpg?x-oss-process=image/quality,q_95/format,webp'
        },
    ]

    response = {'product': products}
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

