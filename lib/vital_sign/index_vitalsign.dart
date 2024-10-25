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

  void senvitalsign() async {
    var url = Uri.parse('${context.read<DataProvider>().platfromURL}/add_hr');
    var res = await http.post(url, body: {
      "public_id": context.read<DataProvider>().id,
      "care_unit_id": context.read<DataProvider>().care_unit_id,
    });
    var resTojson = json.decode(res.body);
    if (res.statusCode == 200) {}
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

  Widget boxText(String title, String vitalsign) {
    String data;
    if (vitalsign.isEmpty || vitalsign == "null") {
      data = "0";
    } else {
      data = vitalsign;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 235, 235, 235),
              border: Border.all(color: const Color.fromARGB(255, 66, 66, 66))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$title $data", style: const TextStyle(fontSize: 40)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text("วัดค่า",
            style: TextStyle(shadows: [
              Shadow(
                  color: Color(0x80000000), offset: Offset(0, 2), blurRadius: 2)
            ], fontSize: 42, color: Color(0xff00A3FF))),
        SizedBox(
            child: showviewvitalsign == 0
                ? Column(
                    children: [
                      const Text("น้หนักส่วนสูง"),
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
                          const Text("ความดัน"),
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
                              const Text("SPO2"),
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
                                  const Text("Temp"),
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
                                      "${context.watch<DataProvider>().width}"),
                                  boxText("ส่วนสูง  ",
                                      "${context.watch<DataProvider>().height}"),
                                  boxText("SYS",
                                      "${context.read<DataProvider>().sys}"),
                                  boxText("DIA",
                                      "${context.read<DataProvider>().dia}"),
                                  boxText("PULSE",
                                      "${context.read<DataProvider>().pulse}"),
                                  boxText("Spo2",
                                      "${context.watch<DataProvider>().spo2}"),
                                  boxText("Temp",
                                      "${context.watch<DataProvider>().temp}"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: downshowviewvitalsign,
                                          child: const Text("ย้อนกลับ")),
                                      ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<DataProvider>()
                                                .updateViewindex("queue");
                                          },
                                          child: const Text("ส่งข้อมูล")),
                                    ],
                                  ),
                                ],
                              ))
      ],
    ));
  }
}
