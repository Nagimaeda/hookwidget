import 'package:flutter/cupertino.dart';

class HomeChangeNotifier extends ChangeNotifier {
  int counter = 0;
  Future<void> reloadState() async {
    counter+=1;
    notifyListeners();
  }
}