import 'package:app_talamed/provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Heightwidth extends StatefulWidget {
  const Heightwidth({super.key});

  @override
  State<Heightwidth> createState() => _HeightwidthState();
}

class _HeightwidthState extends State<Heightwidth> {
  BoxDecoration decoration = BoxDecoration(
      color: const Color.fromARGB(255, 111, 218, 115),
      border: Border.all(color: Colors.green));

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
    return SizedBox(
        child: Column(children: [
      Image.asset("assets/WB-380.jpg"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boxText("น้ำหนัก ", context.watch<DataProvider>().weight),
          boxText("ส่วนสูง  ", context.watch<DataProvider>().height),
        ],
      )
    ]));
  }
}
