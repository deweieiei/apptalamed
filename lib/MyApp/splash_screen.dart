import 'package:app_talamed/MyApp/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
@override
  void initState() {
 Future.delayed(const Duration(seconds: 2), () {
          setState(() {
             Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) =>  const Index()));
          });
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              child: SizedBox(
                  width: width,
                  height: height,
                  child: SvgPicture.asset('assets/backlogo.svg',
                      fit: BoxFit.fill))),
          Positioned(
              child: Center(
            child: SizedBox(child: SvgPicture.asset('assets/logo.svg')),
          )),
         const  Positioned(
             right: 0,
            child:  
          SizedBox(child: CircularProgressIndicator(color: Colors.black)))
        ],
      )),
    );
  }
}
