import 'package:classmeetroom/pages/Home.dart';
import 'package:classmeetroom/pages/login_ui.dart';
import 'package:classmeetroom/pages/pelajaran_ui.dart';
import 'package:classmeetroom/pages/percobaan.dart';
import 'package:classmeetroom/pages/splashlayout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
