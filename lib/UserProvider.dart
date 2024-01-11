import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserProvider extends ChangeNotifier {
  ObjectId? userId;
  String? userName;

  void setUserId(ObjectId id) {
    userId = id;
    notifyListeners();
  }

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }
}
