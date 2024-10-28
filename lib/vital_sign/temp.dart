import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
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
      Image.asset("assets/temp.png"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [boxText("Temp", context.watch<DataProvider>().temp)],
      )
    ]));
  }
}
