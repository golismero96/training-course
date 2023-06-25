import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:resize/resize.dart';

import '../Model/SpecialOfferModel.dart';
import '../Provider/SpecialOffersFutureProvider.dart';
import 'AllProduct.dart';

class SpecialOffersWidget extends StatefulWidget {
  const SpecialOffersWidget({super.key});

  @override
  State<SpecialOffersWidget> createState() => _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends State<SpecialOffersWidget> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
            color: Colors.red,
            height: 300,
            width: double.infinity,
            child: Consumer<SpecialOffersFutureProvider>(
                builder: (context, specialOffersProvider, child) {
              if (specialOffersProvider.specialOffersState == null) {
                return SizedBox();
              } else {
                return FutureBuilder<List<SpecialOfferModel>>(
                    future: specialOffersProvider.specialOffersState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<SpecialOfferModel>? model = snapshot.data;
                        return ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, position) {
                            if (position == 0) {
                              return Container(
                                  height: 300,
                                  width: 370,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SpecialofferItem(model[position]),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Column(
                                                children: [
                                                  SvgPicture.network(
                                                      'https://www.digikala.com/statics/img/svg/specialCarousel/Amazings.svg',
                                                      width: 85,
                                                      height: 85),
                                                  Image.network(
                                                      'https://www.digikala.com/statics/img/png/specialCarousel/box.png',
                                                      height: 120,
                                                      width: 150)
                                                ],
                                              ),
                                            ),
                                            OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                        width: 2,
                                                        color: Colors.white)),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AllProduct()));
                                                },
                                                child: Text(
                                                  'مشاهده همه',
                                                  style: TextStyle(
                                                      fontSize: 6.sp,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: hovered
                                                          ? Colors.white60
                                                          : Colors.white),
                                                )),
                                          ]),
                                    ],
                                  ));
                            } else {
                              if (position == model!.length - 1) {
                                return Container(
                                    height: 300,
                                    width: 350,
                                    child: Row(children: [
                                      Container(
                                        width: 150,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AllProduct()));
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            color: Colors.white,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  RotationTransition(
                                                    turns:
                                                        AlwaysStoppedAnimation(
                                                            90 / 365),
                                                    child: Icon(
                                                      Icons
                                                          .expand_circle_down_outlined,
                                                      size: 50,
                                                      color: Colors
                                                          .lightBlueAccent,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'مشاهده همه',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 8.sp,
                                                        color: Colors.black87),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                      SpecialofferItem(model[position]),
                                    ]));
                              } else {
                                return SpecialofferItem(model[position]);
                              }
                            }
                          },
                          itemCount: model!.length,
                        );
                      } else {
                        return const Center(child: Text("Loading..."));
                      }
                    });
              }
            })));
  }

  Container SpecialofferItem(SpecialOfferModel specialOfferModel) {
    return Container(
      width: 200,
      height: 300,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(specialOfferModel.imgUrl,
                        height: 150, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      specialOfferModel.productName,
                      style: TextStyle(fontSize: 6.5.sp),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text('تومان ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 5.5.sp)),
                                Text(
                                    '${specialOfferModel.off_price.toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 5.5.sp)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('${specialOfferModel.price.toString()}',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                        fontSize: 5.5.sp)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20, left: 10),
                            child: Container(
                              decoration: new BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Text(
                                    '${specialOfferModel.off_precent.toString()}%',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 6.sp)),
                              ),
                            )),
                      )
                    ],
                  )))
                ],
              ),
            ),
          )),
    );
  }
}
