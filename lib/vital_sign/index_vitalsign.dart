import 'dart:convert';

import 'package:app_talamed/provider/provider.dart';
import 'package:app_talamed/vital_sign/height-width.dart';
import 'package:app_talamed/vital_sign/spo2.dart';
import 'package:app_talamed/vital_sign/temp.dart';
import 'package:app_talamed/vital_sign/yuwellBP.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class IndexVitalsign extends StatefulWidget {
  const IndexVitalsign({super.key});

  @override
  State<IndexVitalsign> createState() => _IndexVitalsignState();
}

class _IndexVitalsignState extends State<IndexVitalsign> {
  int showviewvitalsign = 0;
  bool statusBUT = false;

  void senvitalsign() async {
    setState(() {
      statusBUT = true;
    });

    var url = Uri.parse('${context.read<DataProvider>().platfromURL}/add_hr');

    var res = await http.post(url, body: {
      "public_id": context.read<DataProvider>().id,
      "care_unit_id": context.read<DataProvider>().care_unit_id,
      "bp_sys": context.read<DataProvider>().sys.text,
      "bp_dia": context.read<DataProvider>().dia.text,
      "bp":
          "${context.read<DataProvider>().sys.text}/${context.read<DataProvider>().dia.text}",
      "pulse_rate": context.read<DataProvider>().pulse.text,
      "weight": context.read<DataProvider>().weight.text,
      "height": context.read<DataProvider>().height.text,
      "spo2": context.read<DataProvider>().spo2.text,
      "temp": context.read<DataProvider>().temp.text,
    });

    if (res.statusCode == 200) {
      var resToJson = json.decode(res.body);
      debugPrint("Response JSON: $resToJson");
    } else {
      debugPrint("Error: ${res.statusCode}");
    }
    setState(() {
      statusBUT = false;
    });
  }

  int calculateBMI(String weightS, String heightCmS) {
    double heightCm = double.parse(heightCmS);
    double weight = double.parse(weightS);
    double heightM = heightCm / 100;
    return (weight / (heightM * heightM)).round();
  }

  void upshowviewvitalsign() {
    setState(() {
      showviewvitalsign++;
    });
  }

  void downshowviewvitalsign() {
    setState(() {
      showviewvitalsign--;
    });
  }

  Widget boxText(String title, TextEditingController vitalsign) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 240, 240, 240),
                border:
                    Border.all(color: const Color.fromARGB(255, 66, 66, 66))),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title),
                      SizedBox(
                          width: 100,
                          child: TextField(
                              controller: vitalsign,
                              keyboardType: TextInputType.number))
                    ]))));
  }

  TextStyle textStyle = const TextStyle(shadows: [
    Shadow(color: Color(0x80000000), offset: Offset(0, 2), blurRadius: 2)
  ], fontSize: 42, color: Color(0xff00A3FF));
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text("วัดค่า", style: textStyle),
        SizedBox(
            child: showviewvitalsign == 0
                ? Column(
                    children: [
                      Text("น้ำหนักส่วนสูง", style: textStyle),
                      const Heightwidth(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<DataProvider>()
                                    .updateViewindex("รืกำป");
                              },
                              child: const Text("ย้อนกลับ")),
                          ElevatedButton(
                              onPressed: upshowviewvitalsign,
                              child: const Text("ไปต่อ")),
                        ],
                      ),
                    ],
                  )
                : showviewvitalsign == 1
                    ? Column(
                        children: [
                          Text("ความดัน", style: textStyle),
                          const Yuwellbp(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: downshowviewvitalsign,
                                  child: const Text("ย้อนกลับ")),
                              ElevatedButton(
                                  onPressed: upshowviewvitalsign,
                                  child: const Text("ไปต่อ")),
                            ],
                          )
                        ],
                      )
                    : showviewvitalsign == 2
                        ? Column(
                            children: [
                              Text("SPO2", style: textStyle),
                              const Spo2(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: downshowviewvitalsign,
                                      child: const Text("ย้อนกลับ")),
                                  ElevatedButton(
                                      onPressed: upshowviewvitalsign,
                                      child: const Text("ไปต่อ")),
                                ],
                              )
                            ],
                          )
                        : showviewvitalsign == 3
                            ? Column(
                                children: [
                                  Text("Temp", style: textStyle),
                                  const Temp(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: downshowviewvitalsign,
                                          child: const Text("ย้อนกลับ")),
                                      ElevatedButton(
                                          onPressed: upshowviewvitalsign,
                                          child: const Text("ไปต่อ")),
                                    ],
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  boxText("น้ำหนัก ",
                                      context.watch<DataProvider>().weight),
                                  boxText("ส่วนสูง  ",
                                      context.watch<DataProvider>().height),
                                  boxText(
                                      "SYS", context.read<DataProvider>().sys),
                                  boxText(
                                      "DIA", context.read<DataProvider>().dia),
                                  boxText("PULSE",
                                      context.read<DataProvider>().pulse),
                                  boxText("Spo2",
                                      context.watch<DataProvider>().spo2),
                                  boxText("Temp",
                                      context.watch<DataProvider>().temp),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: downshowviewvitalsign,
                                          child: const Text("ย้อนกลับ")),
                                      !statusBUT
                                          ? ElevatedButton(
                                              onPressed: () {
                                                senvitalsign();
                                              },
                                              child: const Text("ส่งข้อมูล"))
                                          : const Positioned(
                                              right: 0,
                                              child: SizedBox(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color:
                                                              Colors.black))),
                                    ],
                                  ),
                                ],
                              ))
      ],
    ));
  }
}
