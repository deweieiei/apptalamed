 
import 'package:app_talamed/MyApp/splash_screen.dart';
import 'package:app_talamed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: ((context) => DataProvider()))
    ], child: const App());
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.grey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
