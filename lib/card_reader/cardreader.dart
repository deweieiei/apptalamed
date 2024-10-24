import 'package:flutter/material.dart';

class Cardreader extends StatefulWidget {
  const Cardreader({super.key});

  @override
  State<Cardreader> createState() => _CardreaderState();
}

class _CardreaderState extends State<Cardreader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('กรุณาเสียบบัตรประชาชนเพื่อทำรายกาย',
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Color(0x80000000),
                  offset: Offset(0, 2),
                  blurRadius: 2,
                ),
              ],
              fontSize: 42,
              color: Color(0xff00A3FF),
            )),
        Image.asset("assets/ppasc.png"),
      ],
    );
  }
}
