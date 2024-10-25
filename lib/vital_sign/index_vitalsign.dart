import 'package:app_talamed/provider/provider.dart';
import 'package:app_talamed/vital_sign/height-width.dart';
import 'package:app_talamed/vital_sign/spo2.dart';
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

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text("วัดค่า"),
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
                        : Column(
                            children: [
                              Text("SYS ${context.read<DataProvider>().sys}"),
                              Text("DIS ${context.read<DataProvider>().dia}"),
                              Text(
                                  "PULSE ${context.read<DataProvider>().pulse}"),
                              Text(
                                  "width ${context.read<DataProvider>().width}"),
                              Text(
                                  "height ${context.read<DataProvider>().height}"),
                              Text("Spo2 ${context.read<DataProvider>().spo2}"),
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
                                      child: const Text("เสร็จสิ้น")),
                                ],
                              ),
                            ],
                          ))
      ],
    ));
  }
}
