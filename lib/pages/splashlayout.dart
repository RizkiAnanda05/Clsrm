import 'package:classmeetroom/pages/Home.dart';
import 'package:classmeetroom/pages/login_ui.dart';
import 'package:flutter/material.dart';

class SplashLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashLayout> {
  Color HexColor = Color(0xFF008DB9);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Welcome",
        home: Scaffold(
          backgroundColor: HexColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            child: Center(
              child: Column(children: [
                Row(
                  children: [
                    const Text(
                      "Wellcome\nTo Class",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Image(
                    width: 188.46,
                    height: 200,
                    image: AssetImage("assets/images/onboard_image.png")),
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: 311,
                  height: 41,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPages();
                      }));
                    },
                    child: const Text("Start"),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
