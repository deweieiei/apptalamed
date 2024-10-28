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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('videocall',
              style: TextStyle(shadows: [
                Shadow(
                    color: Color(0x80000000),
                    offset: Offset(0, 2),
                    blurRadius: 2)
              ], fontSize: 42, color: Color(0xff00A3FF))),
          ElevatedButton(
              onPressed: () {
                context.read<DataProvider>().updateViewindex("index");
              },
              child: const Text("กลับหน้าหลัก"))
        ],
      ),
    );
  }
}
