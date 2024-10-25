import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Yuwellbp extends StatefulWidget {
  const Yuwellbp({super.key});

  @override
  State<Yuwellbp> createState() => _YuwellbpState();
}

class _YuwellbpState extends State<Yuwellbp> {
  BoxDecoration decoration = BoxDecoration(
      color: const Color.fromARGB(255, 111, 218, 115),
      border: Border.all(color: Colors.green));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      Image.asset("assets/hraej.png"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: decoration,
                child: Text("SYS ${context.read<DataProvider>().sys}")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: decoration,
                child: Text("DIA ${context.read<DataProvider>().dia}")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: decoration,
                child: Text("PULSE ${context.read<DataProvider>().pulse}")),
          )
        ],
      )
    ]));
  }
}
