import 'package:classmeetroom/databases/user_auth_services.dart';
import 'package:classmeetroom/pages/Home.dart';
import 'package:classmeetroom/pages/login_ui.dart';
import 'package:classmeetroom/pages/signup_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Main_pages extends StatelessWidget {
  const Main_pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginPages();
              }
            }));
  }
}
