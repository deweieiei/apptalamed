import 'package:flutter/material.dart';

class Spo2 extends StatefulWidget {
  const Spo2({super.key});

  @override
  State<Spo2> createState() => _Spo2State();
}

class _Spo2State extends State<Spo2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Column(children: [Image.asset("assets/spo2.jpeg")]));
  }
}
