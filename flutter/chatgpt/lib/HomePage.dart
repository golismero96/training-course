import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:resize/resize.dart';
import 'package:chatgpt/utils/MyDrawer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import 'Requests/Events.dart';
import 'Requests/SpecialOffers.dart';
import 'Model/EventsModel.dart';
import 'Model/SpecialOfferModel.dart';
import 'Requests/PageView.dart';
import 'Requests/Ventures.dart';
import 'Widget/EventsWidget.dart';
import 'Widget/PageViewWidget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Widget/SpecialOffersWidget.dart';
import 'Widget/ThemeSwitcher.dart';
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
  void initState() {
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
    return Resize(builder: () {
      return Scaffold(
        drawer: const Drawer(child: MyDrawer()),
        appBar: AppBar(
          title: const Text('DadfarJs'),
          backgroundColor: Colors.red,
          actions: <Widget>[
            const ThemeSwitcher(),
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
                        Container(
                          child: isConnected
                              ? const SizedBox.shrink()
                              : errmsg("No Internet Connection Available"),
                        ),
                        const PageViewWidget(),
                        const VenturesWidget(),
                        const SpecialOffersWidget(),
                        const EventsWidget(),
                      ],
                    )),
              ),
            )),
      );
    });
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
