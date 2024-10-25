import 'package:app_talamed/printer/printer.dart';
import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Queue extends StatefulWidget {
  const Queue({super.key});

  @override
  State<Queue> createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("คิว",
              style: TextStyle(shadows: [
                Shadow(
                    color: Color(0x80000000),
                    offset: Offset(0, 2),
                    blurRadius: 2)
              ], fontSize: 42, color: Color(0xff00A3FF))),
          Text("ตัวอย่าง queue 1"),
          Text("รอวีดีโอคอล"),
          const Positioned(
              right: 0,
              child: SizedBox(
                  child: CircularProgressIndicator(color: Colors.black))),
          ElevatedButton(
              onPressed: () {
                context.read<DataProvider>().updateViewindex("videocall");
              },
              child: Text('TestVideo')),
          const Printer()
        ],
      ),
    );
  }
}
