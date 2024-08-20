import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp1/assesementtest1.dart';
import 'package:fitnessapp1/assessmentdetails.dart';
import 'package:fitnessapp1/homepage.dart';
import 'package:flutter/material.dart';
 // Adjust import according to your file structure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage2(),
      
    );
  }
}
