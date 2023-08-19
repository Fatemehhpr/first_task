import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';

class loginProvider extends ChangeNotifier {
  bool isSuccessful = false;
  late User user;

  isValid(List<User> list, String username, String password) async{
    for (var i = 0; i < list.length; i++) {
      if (list[i].username == username && list[i].password == password) {
        isSuccessful = true;
        user = list[i];
        notifyListeners();
      }
      break;
    }
  }
  getdata() {
    return user;
  }
}