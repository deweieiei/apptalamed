import 'package:flutter/material.dart';

class Heightwidth extends StatefulWidget {
  const Heightwidth({super.key});

  @override
  State<Heightwidth> createState() => _HeightwidthState();
}

class _HeightwidthState extends State<Heightwidth> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [Image.asset("assets/WB-380.jpg")]));
  }
}
