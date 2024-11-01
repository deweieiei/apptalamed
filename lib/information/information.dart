import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  TextStyle textStylehead =
      const TextStyle(color: Color.fromARGB(255, 30, 30, 30), fontSize: 18);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    DataProvider dataProvider = context.read<DataProvider>();
    return Center(
      child: Column(
        children: [
          Container(
            width: width * 0.5,
            height: height * 0.15,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: const Color.fromARGB(255, 227, 227, 227)),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      color: Color.fromARGB(255, 188, 188, 188),
                      offset: Offset(5, 5))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("ข้อมูล",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 30, 30, 30))),
                  Row(children: [
                    Text("เลขประจำตัวประชาชน", style: textStylehead),
                    Text(dataProvider.id)
                  ]),
                  Row(children: [
                    Text("เกิดวันที่", style: textStylehead),
                    const Text("9 พ.ค. 2544")
                  ]),
                  Row(children: [
                    Text("ศาสนา", style: textStylehead),
                    const Text("พุทธ")
                  ]),
                  Row(children: [
                    Text("ที่อยู่", style: textStylehead),
                    Text("942/88 ถนนพระราม4 แขวงสุริยวงศ์ เขตบางรัก กรุงเทพฯ")
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                        height: height * 0.05,
                        child: Image.asset("assets/imagesumer.webp"))
                  ])
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<DataProvider>().updateViewindex("vitalsign");
              },
              child: const Text('vitalsign')),
        ],
      ),
    );
  }
}
