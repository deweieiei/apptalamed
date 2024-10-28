import 'package:app_talamed/provider/provider.dart';
import 'package:app_talamed/vital_sign/height-width.dart';
import 'package:app_talamed/vital_sign/senvitalsign.dart';
import 'package:app_talamed/vital_sign/spo2.dart';
import 'package:app_talamed/vital_sign/temp.dart';
import 'package:app_talamed/vital_sign/yuwellBP.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexVitalsign extends StatefulWidget {
  const IndexVitalsign({super.key});

  @override
  State<IndexVitalsign> createState() => _IndexVitalsignState();
}

class _IndexVitalsignState extends State<IndexVitalsign> {
  int showviewvitalsign = 0;

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
                            : const Senvitalsign())
      ],
    ));
  }
}
