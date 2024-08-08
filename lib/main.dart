import 'package:flutter/material.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/widgets/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingsplash = true;
  Loadhome() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showingsplash = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Loadhome();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Snack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: showingsplash ? const SplashScreen() : const HomeScreen(),
    );
  }
}
