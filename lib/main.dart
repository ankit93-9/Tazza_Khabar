import 'package:flutter/material.dart';
import 'package:taza_khabar/view/home.dart';
import 'package:taza_khabar/view/widgets/splash.dart';
void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
     // ignore: non_constant_identifier_names
     bool showingsplash = true;
     loadhome() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showingsplash = false;
      });
    });
  }

 @override
  void initState() {
    super.initState();                                        
    loadhome();
  }



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Taaza Khabar",
      theme: ThemeData(
       primarySwatch: Colors.blue
      ),
       home: showingsplash ? const Splashscreen() : const HomeScreen(),
     
     
      );
    }
}