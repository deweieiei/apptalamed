import 'package:app_talamed/MyApp/bodydrawer.dart';
import 'package:app_talamed/card_reader/cardreader.dart';
import 'package:app_talamed/information/information.dart';
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
    DataProvider dataProvider = context.watch<DataProvider>();
    return Scaffold(
      drawer: const Drawer(child: BodyDrawer()),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        child: ListView(
          children: [
            SizedBox(
                width: width,
                height: height * 0.15,
                child: SvgPicture.asset(
                  'assets/tghjk.svg',
                  fit: BoxFit.fill,
                )),
            Container(
                color: Colors.white,
                height: height * 0.84,
                child: ListView(
                  children: [
                    dataProvider.viewIndex == "information"
                        ? const Information()
                        : dataProvider.viewIndex == "vitalsign"
                            ? const IndexVitalsign()
                            : dataProvider.viewIndex == "queue"
                                ? const Queue()
                                : dataProvider.viewIndex == "videocall"
                                    ? const Videocall()
                                    : Column(
                                        children: [
                                          const Cardreader(),
                                          ElevatedButton(
                                              onPressed: () {
                                                dataProvider.updateViewindex(
                                                    "information");
                                              },
                                              child: const Text('Test')),
                                          ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<DataProvider>()
                                                    .updateViewindex("queue");
                                              },
                                              child: const Text('queue')),
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
