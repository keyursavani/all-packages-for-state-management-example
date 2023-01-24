import 'package:flutter/cupertino.dart';

class DataClass extends ChangeNotifier{
  int _x = 0;
  int get x => _x;
  void increment(){
    _x++;
    notifyListeners();
  }
  void decrement(){
    _x--;
    notifyListeners();
  }
}