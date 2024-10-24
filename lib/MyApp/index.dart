import 'package:app_talamed/MyApp/numpad.dart';
import 'package:app_talamed/card_reader/cardreader.dart';
import 'package:app_talamed/vital_sign/index_vitalsign.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Cardreader(),
            Numpad(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IndexVitalsign()));
                },
                child: const Text('Test'))
          ],
        ),
      ),
    ));
  }
}
