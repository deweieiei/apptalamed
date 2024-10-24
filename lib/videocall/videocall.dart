import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Videocall extends StatefulWidget {
  const Videocall({super.key});

  @override
  State<Videocall> createState() => _VideocallState();
}

class _VideocallState extends State<Videocall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('หน้าvideocall'),
            ElevatedButton(
                onPressed: () {
                  context.read<DataProvider>().updateViewindex("index");
                },
                child: Text("กลับหน้าหลัก"))
          ],
        ),
      ),
    );
  }
}
