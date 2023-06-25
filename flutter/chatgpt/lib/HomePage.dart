
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resize/resize.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatgpt/utils/MyDrawer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';


import 'Requests/Events.dart';
import 'Requests/SpecialOffers.dart';
import 'Widget/AllProduct.dart';
import 'Model/EventsModel.dart';
import 'Model/PageViewModel.dart';
import 'Model/SpecialOfferModel.dart';
import 'Model/VenturesModel.dart';
import 'Provider/ChangeNotifier.dart';
import 'Requests/PageView.dart';
import 'Requests/Ventures.dart';
import 'Widget/PageViewWidget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Widget/VenturesWidget.dart';




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
  Future<List<SpecialOfferModel>>? specialofferFuture;
  Future<List<EventsModel>>? eventsFuture;

  String baseAPI = 'http://151.80.86.139:8080';

  void ImproveState() async {
    SendRequestVentures(context);
    SendRequestPageView(context);
    SendRequestSpecialOffers(context);
    SendRequestEvents(context);

    var isInternet = await checkConnectionStatus();
    if (isInternet) {
      setState(() {
        updatedVariables = true;
      });
    }
  }

  void CheckConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        var isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!updatedVariables) {
          ImproveState();
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
  void initState() async {
    super.initState();
    CheckConnectivity();
    ImproveState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }


  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Resize(
        builder: () {
          return Scaffold(
            drawer: const Drawer(child: MyDrawer()),
            appBar: AppBar(
              title: const Text('DadfarJs'),
              backgroundColor: Colors.red,
              actions: <Widget>[
                    IconButton(
                      onPressed: () {
                        counterModel.increment();
                      },
                      icon: const Icon(Icons.search),
                    ),
                IconButton(
                      onPressed: () {
                        counterModel.decrement();
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                updatedVariables
                    ? const SizedBox.shrink()
                    : IconButton(
                  icon: const Icon(Icons.refresh_outlined),
                  onPressed: () {
                    ImproveState();
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
                    ImproveState();
                  },
                  child: SingleChildScrollView(
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            // if(!isConnected)DialogConnectionStatus(),
                            Consumer<CounterModel>(
                              builder: (context, counterModel, child) {
                                return Text(
                                  'Counter: ${counterModel.counter}',
                                );
                              },
                            ),
                            Container(
                              child: isConnected
                                  ? const SizedBox.shrink()
                                  : errmsg("No Internet Connection Available"),
                            ),
                            PageViewWidget(),
                            VenturesWidget(),
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
                                                                          fontSize:
                                                                          6.sp,
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
                                                                child: Column(
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
                                                                            fontWeight: FontWeight.w800,
                                                                            fontSize: 8.sp,
                                                                            color: Colors.black87
                                                                        ),
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
                                      return const Center(child: Text("Loading..."));
                                    }
                                  }),
                            ),
                          ],
                        )),
                  ),
                )),
          );
        }
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


}
