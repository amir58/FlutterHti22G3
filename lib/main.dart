import 'package:flutter/material.dart';
import 'package:hti22three/first_screen.dart';
import 'package:hti22three/login_screen.dart';
import 'package:hti22three/messenger_screen.dart';
import 'package:hti22three/sceond_screen.dart';
import 'package:hti22three/stack_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessengerScreen(),
    );
  }
}

