import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Spo2 extends StatefulWidget {
  const Spo2({super.key});

  @override
  State<Spo2> createState() => _Spo2State();
}

class _Spo2State extends State<Spo2> {
  BoxDecoration decoration = BoxDecoration(
      color: const Color.fromARGB(255, 111, 218, 115),
      border: Border.all(color: Colors.green));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      Image.asset("assets/spo2.jpeg"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: decoration,
                child: Text("Spo2 ${context.read<DataProvider>().spo2}")),
          )
        ],
      )
    ]));
  }
}
