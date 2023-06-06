
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

List CheckConnectivity() {
  Completer<bool> completer = Completer<bool>();
  var subscription = Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      completer.complete(true);
    } else {
      completer.complete(false);
    }
  });
  return [subscription, completer.future];
}