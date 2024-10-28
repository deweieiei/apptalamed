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

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = context.read<DataProvider>();
    return SizedBox(
        child: Column(children: [
      Image.asset("assets/WB-380.jpg"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boxText("น้ำหนัก ", dataProvider.weight),
          boxText("ส่วนสูง  ", dataProvider.height),
        ],
      )
    ]));
  }
}
