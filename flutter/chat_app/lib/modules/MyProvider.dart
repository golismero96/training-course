// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'User.dart';

enum Themdata{dark, light}


class MyProvider with ChangeNotifier{
  bool isLoading = false;
  var theme = Themdata.light;
  User? user;

  setUser(User data) {
    user = data;
    notifyListeners();
  }

  setTheme(Themdata data) {
    theme = data;
    notifyListeners();
  }

  setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
