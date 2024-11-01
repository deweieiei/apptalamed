import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'dart:async';

// ignore: must_be_immutable
class BoxText extends StatefulWidget {
  BoxText({super.key, this.text});
  String? text;
  @override
  State<BoxText> createState() => _BoxTextState();
}

class _BoxTextState extends State<BoxText> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    TextStyle style = TextStyle(
      shadows: const [
        Shadow(
          color: Color(0x80000000),
          offset: Offset(0, 2),
          blurRadius: 2,
        ),
      ],
      fontFamily: context.read<DataProvider>().family,
      fontSize: width * 0.035,
      color: const Color(0xff00A3FF),
    );
    return widget.text == null
        ? const Text('')
        : Center(
            child: Text(
              widget.text.toString(),
              style: style,
            ),
          );
  }
}

// ignore: must_be_immutable
class Numpad extends StatefulWidget {
  Numpad({super.key});

  @override
  State<Numpad> createState() => _NumpadState();

  // final Stream<String> entry;
  StreamController<String>? entry;

  void setValue(String val) {
    // setState(() {
    //   passwordslogin = val;
    //   context.read<Datafunction>().playsound();
    // });

    entry?.sink.add(val);

    //  state.setValue(val);
  }
}

class _NumpadState extends State<Numpad> {
  String passwordslogin = '';
  String colortexts = 'back';
  StreamController<String> entry = StreamController<String>();

  void setValue(String val) {
    entry.sink.add(val);
  }

  void chakepasswordslogin() {
    // context.read<Datafunction>().playsound();
    if (passwordslogin.length >= 14) {
      setState(() {
        passwordslogin.substring(0, 1);
        int g = passwordslogin.length - 1;
        passwordslogin = passwordslogin.substring(0, g);
        //     context.read<DataProvider>().id = passwordslogin;
      });
    } else if (passwordslogin.length == 13) {
      int id = checkDigit(passwordslogin);
      String ids = id.toString();
      if (ids == passwordslogin[12]) {
        colortexts = 'green';

        setState(() {
          context.read<DataProvider>().id = passwordslogin;
          //  print(context.read<DataProvider>().id);
        });
      } else {
        setState(() {
          colortexts = 'red';

          context.read<DataProvider>().id = passwordslogin;
          //  print(context.read<DataProvider>().id);
        });
      }
    } else {
      colortexts = 'back';

      setState(() {
        context.read<DataProvider>().id = passwordslogin;
        //  print(context.read<DataProvider>().id);
      });
    }
  }

  int checkDigit(String id) {
    int sum = 0;
    for (int i = 0; i < 12; i++) {
      int digit = int.parse(id[i]);
      sum += digit * (13 - i);
    }

    int remainder = sum % 11;
    int result = (11 - remainder) % 10;

    return result;
  }

  @override
  void initState() {
    passwordslogin = '';

    widget.entry = entry;

    entry.stream.listen((String data) {
      setState(() {
        colortexts = 'green';
        passwordslogin = data;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Decoration decoration = BoxDecoration(boxShadow: const [
      BoxShadow(
          color: Color.fromARGB(255, 170, 170, 170),
          offset: Offset(1, 1),
          blurRadius: 2)
    ], color: Colors.white, borderRadius: BorderRadius.circular(5));
    TextStyle style = TextStyle(
        fontSize: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) *
            0.012,
        fontWeight: FontWeight.w600);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.02),
        SizedBox(
            width: width * 0.6,
            child: BoxText(text: 'กรุณาเสียบบัตรประชาชนหรือกรอกรหัส')),
        SizedBox(
            width: width * 0.6,
            child: BoxText(text: 'บัตรประชาชน เพื่อทำการเข้าสู่ระบบ')),
        SizedBox(height: height * 0.02),
        const BoxID(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 170, 170, 170),
                  offset: Offset(0, 0),
                  blurRadius: 2)
            ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}7';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('7', style: style))))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}8';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('8', style: style))))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}9';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('9', style: style)))))
                      ])),
              Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}4';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('4', style: style))))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}5';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('5', style: style))))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}6';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('6', style: style)))))
                      ])),
              Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}1';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('1', style: style))))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}2';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('2', style: style))))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}3';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('3', style: style)))))
                      ])),
              Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  if (context.read<DataProvider>().password ==
                                      context.read<DataProvider>().id) {
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const Setting()));
                                  }
                                },
                                child: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordslogin = '${passwordslogin}0';
                                    chakepasswordslogin();
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('0', style: style))))),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    //   context.read<Datafunction>().playsound();
                                    colortexts = 'back';
                                    passwordslogin.substring(0, 1);
                                    int g = passwordslogin.length - 1;
                                    passwordslogin =
                                        passwordslogin.substring(0, g);
                                    context.read<DataProvider>().id =
                                        passwordslogin;
                                  });
                                },
                                child: Container(
                                    decoration: decoration,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Center(
                                        child: Text('ลบ', style: style)))))
                      ]))
            ])),
      ],
    );
  }
}

class BoxID extends StatefulWidget {
  const BoxID({super.key});

  @override
  State<BoxID> createState() => _BoxIDState();
}

class _BoxIDState extends State<BoxID> {
  Timer? timer;
  var id = '';
  @override
  void initState() {
    super.initState();
    id == '';
    //  start();
  }

  void start() {
    timer = Timer.periodic(const Duration(microseconds: 200), (Timer t) {
      setState(() {
        id = context.read<DataProvider>().id;
      });
    });
  }

  void stop() {
    // setState(() {
    //   timer?.cancel();
    // });
  }

  @override
  void dispose() {
    stop();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.05,
      width: width * 0.6,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Color.fromARGB(255, 170, 170, 170),
            offset: Offset(0, 0),
            blurRadius: 1)
      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.read<DataProvider>().id,
            style: TextStyle(
                color: Colors.black,
                fontSize: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) *
                    0.012,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
