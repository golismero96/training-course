
import 'package:flutter/material.dart';

import 'User.dart';

class MyProvider with ChangeNotifier{
  User? user;

  setUser(User data) {
    user = data;
    notifyListeners();
  }
}
