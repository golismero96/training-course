
import 'package:flutter/material.dart';

import 'User.dart';

class MyProvider with ChangeNotifier{
  bool isLoading = false;
  User? user;

  setUser(User data) {
    user = data;
    notifyListeners();
  }

  setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
