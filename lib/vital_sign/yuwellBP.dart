import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Yuwellbp extends StatefulWidget {
  const Yuwellbp({super.key});

  @override
  State<Yuwellbp> createState() => _YuwellbpState();
}

class _YuwellbpState extends State<Yuwellbp> {
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
    return SizedBox(
        child: Column(children: [
      Image.asset("assets/hraej.png"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boxText("SYS", context.read<DataProvider>().sys),
          boxText("DIA", context.read<DataProvider>().dia),
          boxText("PULSE", context.read<DataProvider>().pulse)
        ],
      )
    ]));
  }
}
