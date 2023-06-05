import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt/utils/MyDrawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'AllProduct.dart';
import 'Model/EventsModel.dart';
import 'Model/PageViewModel.dart';
import 'Model/SpecialOfferModel.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:convert';
import 'Model/VenturesModel.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.grey,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Vazir')),
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hovered = false;
  bool isConnected = false;
  String connectionTool = '';
  bool updatedVariables = false;
  late StreamSubscription subscription;
  Future<List<PageViewModel>>? pageViewFuture;
  Future<List<SpecialOfferModel>>? specialofferFuture;
  Future<List<EventsModel>>? eventsFuture;
  Future<List<VenturesModel>>? venturesFuture;

  PageController pageController = PageController();
  String baseAPI = 'http://151.80.86.139:8080';

  void customInitialState() async {
    var venturesVal = VenturesRender();
    var pageViewVal = SendRequestPageView();
    var specialofferVal = SendRequestSpecialOffer();
    var eventsVal = SendRequestEvents();

    var isInternet = await checkConnectionStatus();
    if(isInternet) {
      setState(() {
        pageViewFuture = pageViewVal;
        venturesFuture = venturesVal;
        specialofferFuture = specialofferVal;
        eventsFuture = eventsVal;
        updatedVariables = true;
      });
    }
  }

  void CheckConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if(result != ConnectivityResult.none) {
        var isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if(!updatedVariables) {
          customInitialState();
        }
        setState(() {
          isConnected = isDeviceConnected;
        });
      } else {
        setState(() {
          isConnected = false;
          updatedVariables = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    CheckConnectivity();
    customInitialState();
  }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: MyDrawer()),
      appBar: AppBar(
        title: const Text('DadfarJs'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          updatedVariables ? const SizedBox.shrink() :  IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              customInitialState();
            },
          ),
        ],
      ),
      body: Theme(
          data: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
          ),
          child: RefreshIndicator(
            color: Colors.red,
            onRefresh: () async {
              customInitialState();
            },
            child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // if(!isConnected)DialogConnectionStatus(),
                      Container(
                          child: isConnected ? const SizedBox.shrink() : errmsg("No Internet Connection Available"),
                      ),
                      Container(
                        height: 200,
                        child: FutureBuilder<List<PageViewModel>>(
                            future: pageViewFuture,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<PageViewModel>? model = snapshot.data;
                                return Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    PageView.builder(
                                      reverse: true,
                                      controller: pageController,
                                      scrollDirection: Axis.horizontal,
                                      allowImplicitScrolling: true,
                                      itemCount: model!.length,
                                      itemBuilder: (context, position) {
                                        return PageViewItems(model[position]);
                                      },
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: SmoothPageIndicator(
                                        textDirection: TextDirection.rtl,
                                        controller: PageController(),
                                        count: model.length,
                                        effect: const ExpandingDotsEffect(
                                          dotColor: Colors.white,
                                          activeDotColor: Colors.red,
                                          dotHeight: 10,
                                          dotWidth: 8,
                                          spacing: 5.0,
                                          expansionFactor: 4,
                                        ),
                                        onDotClicked: (index) => {
                                          pageController.animateToPage(
                                            index,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.ease,
                                          )
                                        },
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return Container(
                                    color: Colors.grey[400],
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset('images/notImage.png'),
                                          JumpingDotsProgressIndicator(
                                            fontSize: 65.0,
                                          ),
                                        ]));
                              }
                            }),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                              height: 70,
                              width: double.infinity,
                              child: FutureBuilder<List<VenturesModel>>(
                                  future: venturesFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<VenturesModel>? model =
                                          snapshot.data;
                                      return ListView.builder(
                                          reverse: true,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, position) {
                                            return VenturesRenderItem(
                                                model[position]);
                                          },
                                          itemCount: model!.length);
                                    } else {
                                      return const Center(
                                          child: Text("Loading..."));
                                    }
                                  }))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                              color: Colors.red,
                              height: 300,
                              width: double.infinity,
                              child: FutureBuilder<List<SpecialOfferModel>>(
                                  future: specialofferFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<SpecialOfferModel>? model =
                                          snapshot.data;
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SpecialofferItem(
                                                        model[position]),
                                                    Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10,
                                                                    right: 10),
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
                                                                      color: Colors
                                                                          .white)),
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                AllProduct()));
                                                              },
                                                              child: Text(
                                                                'مشاهده همه',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: hovered
                                                                        ? Colors
                                                                            .white60
                                                                        : Colors
                                                                            .white),
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
                                                                  builder:
                                                                      (context) =>
                                                                          AllProduct()));
                                                        },
                                                        child: Card(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          color: Colors.white,
                                                          child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                RotationTransition(
                                                                  turns: AlwaysStoppedAnimation(
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
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                    SpecialofferItem(
                                                        model[position]),
                                                  ]));
                                            } else {
                                              return SpecialofferItem(
                                                  model[position]);
                                            }
                                          }
                                        },
                                        itemCount: model!.length,
                                      );
                                    } else {
                                      return const Center(
                                          child: Text("Loading..."));
                                    }
                                  }))),
                      Container(
                        width: double.infinity,
                        child: FutureBuilder<List<EventsModel>>(
                            future: eventsFuture,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<EventsModel>? model = snapshot.data;
                                return Container(
                                  height: 340,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                          const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 150,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                      model![0].imgUrl,
                                                      fit: BoxFit.fill,
                                                      width: 180)),
                                            ),
                                            Container(
                                              height: 150,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                      model![1].imgUrl,
                                                      fit: BoxFit.fill,
                                                      width: 180)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 150,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                    model![2].imgUrl,
                                                    fit: BoxFit.fill,
                                                    width: 180)),
                                          ),
                                          Container(
                                            height: 150,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                    model![3].imgUrl,
                                                    fit: BoxFit.fill,
                                                    width: 180)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Text("Loading..."));
                              }
                            }),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }

  Widget errmsg(String text) {
    //error message widget.
    return Container(
        padding: const EdgeInsets.all(10.00),
        margin: const EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 6.00),
            child: const Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: const TextStyle(color: Colors.white)),
          //show error message text
        ]),
      );
  }

  Future<bool> checkConnectionStatus() async {
    var connectivityResult = await InternetConnectionChecker().hasConnection;
    if (connectivityResult) {
      setState(() {
        isConnected = true;
      });
      return true;
    } else {
      setState(() {
        isConnected = false;
      });
      return false;
    }
  }

  Container VenturesRenderItem(VenturesModel venturesModel) {
    return Container(
      width: 85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            venturesModel.imgUrl,
            width: 40,
            height: 40,
          ),
          Text(utf8.decode(venturesModel.text.toString().codeUnits),
              style: TextStyle(fontSize: 12))
        ],
      ),
    );
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
                    child: Text(specialOfferModel.productName),
                  ),
                  Expanded(
                      child: Container(
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text('تومان ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11)),
                                Text(
                                    '${specialOfferModel.off_price.toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('${specialOfferModel.price.toString()}',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                        fontSize: 14)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 10),
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
                                        fontSize: 12.8)),
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

  Future<List<VenturesModel>> VenturesRender() async {
    List<VenturesModel> models = [];
    try {
      final response =
          await http.get(Uri.parse('${baseAPI}/events/venturesRender/'));
      var responseData = json.decode(response.body);

      for (var model in responseData['ventures']) {
        models.add(VenturesModel(model['text'], model['imgurl']));
      }
      return models;
    } catch (error) {
      // Handle the error here
      print('Error occurred during API request: $error');
      return []; // Or you can return a default value or handle it in a different way
    }
  }

  Future<List<EventsModel>> SendRequestEvents() async {
    List<EventsModel> models = [];

    try {
      final response = await http.get(Uri.parse('${baseAPI}/events/'));
      var responseData = json.decode(response.body);

      for (var item in responseData['product']) {
        models.add(EventsModel(item['imgUrl']));
      }
      return models;
    } catch (error) {
      // Handle the error here
      print('Error occurred during API request: $error');
      return []; // Or you can return a default value or handle it in a different way
    }
  }

  Future<List<PageViewModel>> SendRequestPageView() async {
    List<PageViewModel> model = [];

    try {
      final response = await http.get(Uri.parse('${baseAPI}/pageViewPics/'));
      var responseData = json.decode(response.body);

      for (var item in responseData['photos']) {
        model.add(PageViewModel(item['id'], item['imgurl']));
      }
      return model;
    } catch (error) {
      // Handle the error here
      print('Error occurred during API request: $error');
      return [];
    }
  }

  Future<List<SpecialOfferModel>> SendRequestSpecialOffer() async {
    List<SpecialOfferModel> models = [];

    try {
      final response = await http.get(Uri.parse('${baseAPI}/specialOffer/'));
      var responseData = json.decode(response.body);

      for (var item in responseData['product']) {
        models.add(SpecialOfferModel(
            item['id'],
            utf8.decode(item['productName'].toString().codeUnits),
            item['price'],
            item['off_price'],
            item['off_precent'],
            item['imgUrl']));
      }

      return models;
    } catch (error) {
      // Handle the error here
      print('Error occurred during API request: $error');
      return []; // Or you can return a default value or handle it in a different way
    }
  }

  Padding PageViewItems(PageViewModel pageViewModel) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadiusGeometry.lerp(
                BorderRadius.circular(10.0), BorderRadius.circular(10.0), 10),
            child: Container(
              child: Image.network(pageViewModel.imgurl, fit: BoxFit.fill),
            )));
  }
}
