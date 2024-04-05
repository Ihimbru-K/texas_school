import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/firebase_options.dart';
import 'package:form/ui/behind_the_wheel_only.dart';
import 'package:form/ui/classroom_behind_the_wheel.dart';
import 'package:form/ui/screen1.dart';
import 'package:form/ui/screen4.dart';
import 'package:form/ui/screen6.dart';
import 'package:form/ui/splash.dart';
import 'package:form/ui/submited_data.dart';



void main() async {
  /**
   * Initializing firebase in main dart file
   * */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contract',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
  // home: BehindTheWheelOnly(),
      home: SchoolRepresentative(),
    );
  }
}


