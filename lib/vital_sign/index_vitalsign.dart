import 'package:app_talamed/provider/provider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const Text("วัดค่า"),
            SizedBox(
                child: showviewvitalsign == 0
                    ? Column(
                        children: [
                          const Yuwellbp(),
                          ElevatedButton(
                              onPressed: upshowviewvitalsign,
                              child: const Text("ไปต่อ"))
                        ],
                      )
                    : showviewvitalsign == 1
                        ? Column(
                            children: [
                              const Text("น้หนักส่วนสูง"),
                              ElevatedButton(
                                  onPressed: upshowviewvitalsign,
                                  child: const Text("ไปต่อ"))
                            ],
                          )
                        : showviewvitalsign == 2
                            ? Column(
                                children: [
                                  const Text("SPO2"),
                                  ElevatedButton(
                                      onPressed: upshowviewvitalsign,
                                      child: const Text("ไปต่อ"))
                                ],
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<DataProvider>()
                                      .updateViewindex("queue");
                                },
                                child: const Text("เสร็จสิ้น")))
          ],
        )),
      ),
    );
  }
}
