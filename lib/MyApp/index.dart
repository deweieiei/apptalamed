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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        child: Column(
          children: [
            SizedBox(
                width: width,
                height: height * 0.15,
                child: SvgPicture.asset(
                  'assets/tghjk.svg',
                  fit: BoxFit.fill,
                )),
            SizedBox(
                height: height * 0.84,
                child: ListView(
                  children: [
                    context.watch<DataProvider>().viewIndex == "vitalsign"
                        ? const IndexVitalsign()
                        : context.watch<DataProvider>().viewIndex == "queue"
                            ? const Queue()
                            : context.watch<DataProvider>().viewIndex ==
                                    "videocall"
                                ? const Videocall()
                                : Column(
                                    children: [
                                      const Cardreader(),
                                      ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<DataProvider>()
                                                .updateViewindex("vitalsign");
                                          },
                                          child: const Text('Test')),
                                    ],
                                  ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
