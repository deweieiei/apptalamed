import 'package:app_talamed/vital_sign/yuwellBP.dart';
import 'package:flutter/material.dart';

class IndexVitalsign extends StatefulWidget {
  const IndexVitalsign({super.key});

  @override
  State<IndexVitalsign> createState() => _IndexVitalsignState();
}

class _IndexVitalsignState extends State<IndexVitalsign> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [Text("วัดค่า"), Yuwellbp()],
        )),
      ),
    );
  }
}
