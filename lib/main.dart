import 'package:classmeetroom/pages/main_page.dart';
import 'package:classmeetroom/pages/pelajaran_ui.dart';
import 'package:classmeetroom/pages/signup_ui.dart';
import 'package:classmeetroom/pages/tugas_ui.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              titleLarge: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              titleMedium: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              titleSmall: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))),
      home: Main_pages(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/Home', page: () => Main_pages()),
        GetPage(name: '/Mapel', page: () => Mapel()),
        GetPage(name: '/SignUp', page: () => SignUp()),
        GetPage(name: '/detail', page: () => Tugas())
      ]

      // '/': (context) => Main_pages(),
      // '/add': (context) => SignUp(),
      // '/mapel': (context) => Mapel()
      ,
    );
  }
}
