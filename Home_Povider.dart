import 'package:flutter/material.dart';


class State_Provider with ChangeNotifier{
  int bca=0;
  int bba=0;
  int mca=0;
  int mba=0;
  int update_Course=0;

  void change_State(){
    notifyListeners();
  }
}