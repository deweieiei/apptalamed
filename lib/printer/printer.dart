import 'package:flutter/material.dart';

class Printer extends StatefulWidget {
  const Printer({super.key});

  @override
  State<Printer> createState() => _PrinterState();
}

class _PrinterState extends State<Printer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(onPressed: () {}, child: const Text("Printer")),
    );
  }
}
