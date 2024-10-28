import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  String id = "1710501456572";

  String password = "";

  String family = "";

  String care_unit = "";

  String name_hospital = "";

  String platfromURL = "https://emr-life.com/clinic_master/clinic/Api";

  String care_unit_id = "63d79d61790f9bc857000006";

  TextEditingController sys = TextEditingController(),
      dia = TextEditingController(),
      pulse = TextEditingController(),
      height = TextEditingController(),
      weight = TextEditingController(),
      spo2 = TextEditingController(),
      temp = TextEditingController(),
      idcard = TextEditingController();

  String viewIndex = "index";

  void updateViewindex(String nameView) {
//index
//vitalsign
//queue
//videocall
//information
    viewIndex = nameView;
    notifyListeners();
  }
}
