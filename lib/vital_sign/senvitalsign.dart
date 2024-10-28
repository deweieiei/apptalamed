import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Senvitalsign extends StatefulWidget {
  const Senvitalsign({super.key});

  @override
  State<Senvitalsign> createState() => _SenvitalsignState();
}

class _SenvitalsignState extends State<Senvitalsign> {
  bool statusBUT = false;

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
      // ignore: use_build_context_synchronously
      context.read<DataProvider>().updateViewindex("queue");
    } else {
      debugPrint("Error: ${res.statusCode}");
    }
    setState(() {
      statusBUT = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = context.read<DataProvider>();
    return Column(
      children: [
        boxText("น้ำหนัก ", dataProvider.weight),
        boxText("ส่วนสูง  ", dataProvider.height),
        boxText("SYS", dataProvider.sys),
        boxText("DIA", dataProvider.dia),
        boxText("PULSE", dataProvider.pulse),
        boxText("Spo2", dataProvider.spo2),
        boxText("Temp", dataProvider.temp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<DataProvider>().updateViewindex("index");
                },
                child: const Text("หน้าเเรก")),
            !statusBUT
                ? ElevatedButton(
                    onPressed: () {
                      senvitalsign();
                    },
                    child: const Text("ส่งข้อมูล"))
                : const Positioned(
                    right: 0,
                    child: SizedBox(
                        child: CircularProgressIndicator(color: Colors.black))),
          ],
        ),
      ],
    );
  }
}
