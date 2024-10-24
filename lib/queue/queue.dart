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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("หน้่า queue "),
            Text("ตัวอย่าง queue 1"),
            ElevatedButton(
                onPressed: () {
                  context.read<DataProvider>().updateViewindex("videocall");
                },
                child: Text('TestVideo'))
          ],
        ),
      ),
    );
  }
}
