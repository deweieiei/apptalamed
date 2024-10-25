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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      Image.asset("assets/WB-380.jpg"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: decoration,
                child: Text("น้ำหนัก ${context.read<DataProvider>().width}")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: decoration,
                child: Text("ส่วนสูง  ${context.read<DataProvider>().width}")),
          )
        ],
      )
    ]));
  }
}
