
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> CheckConnectionStatus() async {
  // Completer<bool> completer = Completer<bool>();
  // var subscription = Connectivity()
  //     .onConnectivityChanged
  //     .listen((ConnectivityResult result) async {
  //   if (result != ConnectivityResult.none) {
  //     completer.complete(true);
  //   } else {
  //     completer.complete(false);
  //   }
  // });
  // return [subscription, completer.future];


  var connectivityResult = await InternetConnectionChecker().hasConnection;
  if (connectivityResult) {
    return true;
  } else {
    return false;
  }
}