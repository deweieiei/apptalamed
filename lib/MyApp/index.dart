import 'package:app_talamed/card_reader/cardreader.dart';
import 'package:app_talamed/provider/provider.dart';
import 'package:app_talamed/queue/queue.dart';
import 'package:app_talamed/videocall/videocall.dart';
import 'package:app_talamed/vital_sign/index_vitalsign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        child: context.watch<DataProvider>().viewIndex == "vitalsign"
            ? const Scaffold(body: IndexVitalsign())
            : context.watch<DataProvider>().viewIndex == "queue"
                ? const Queue()
                : context.watch<DataProvider>().viewIndex == "videocall"
                    ? const Videocall()
                    : Scaffold(
                        body: SizedBox(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Cardreader(),
                              //  Numpad(),
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<DataProvider>()
                                        .updateViewindex("vitalsign");
                                  },
                                  child: const Text('Test'))
                            ],
                          ),
                        ),
                      )),
      ),
    );
  }
}
