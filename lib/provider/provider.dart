import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  String id = "";

  String password = "";

  String family = "";

  String care_unit = "";

  String name_hospital = "";

  String platfromURL = "";

  String care_unit_id = "";

  String viewIndex = "index";

  void updateViewindex(String nameView) {
//index
//vitalsign
//queue
//videocall
    viewIndex = nameView;
    notifyListeners();
  }
}
