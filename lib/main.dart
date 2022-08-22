import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22three/assets.dart';
import 'package:hti22three/bmi/bmi_screen.dart';
import 'package:hti22three/contacts/contacts_cubit.dart';
import 'package:hti22three/contacts/contacts_screen.dart';
import 'package:hti22three/contacts/main_contacts_screen.dart';
import 'package:hti22three/first_screen.dart';
import 'package:hti22three/login_screen.dart';
import 'package:hti22three/messenger_screen.dart';
import 'package:hti22three/sceond_screen.dart';
import 'package:hti22three/stack_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


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
      home: BlocProvider(
        create: (context) => ContactsCubit(),
        child: MainContactsScreen(),
      ),
    );
  }
}

