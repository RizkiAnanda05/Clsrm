// ignore_for_file: avoid_unnecessary_containers

import 'package:classmeetroom/databases/db_helper.dart';
import 'package:classmeetroom/databases/user_auth_services.dart';
import 'package:classmeetroom/pages/Home.dart';
import 'package:classmeetroom/pages/login_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _signup();
}

// ignore: camel_case_types
class _signup extends State<SignUp> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpass = TextEditingController();
  final _numberphone = TextEditingController();
  final _username = TextEditingController();

  final _nisn = TextEditingController();
  final _kelas = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpass.dispose();
    _numberphone.dispose();
    _username.dispose();
    _nisn.dispose();
    _kelas.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF008DB9),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 103,
                ),
                const Text(
                  "SignUp",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _emailcontroller,
                    style: TextStyle(color: Colors.black54),
                    decoration: const InputDecoration(
                        hintText: "Example@gmial.com",
                        border: InputBorder.none),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Username",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _username,
                    style: TextStyle(color: Colors.black54),
                    decoration: const InputDecoration(
                        hintText: "Username", border: InputBorder.none),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "No Telepon",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _numberphone,
                    style: TextStyle(color: Colors.black54),
                    decoration: const InputDecoration(
                        hintText: "No Telepon", border: InputBorder.none),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Kelas",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _kelas,
                    style: TextStyle(color: Colors.black54),
                    decoration: const InputDecoration(
                        hintText: "Kelas", border: InputBorder.none),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Nisn",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _nisn,
                    style: TextStyle(color: Colors.black54),
                    decoration: const InputDecoration(
                        hintText: "Nisn", border: InputBorder.none),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    style: TextStyle(color: Colors.black54),
                    decoration: const InputDecoration(
                        hintText: "Password", border: InputBorder.none),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Re-type Password",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _confirmpass,
                    style: TextStyle(color: Colors.black54),
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Re-type Password", border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(text: "Have an acount? ", children: <TextSpan>[
                    TextSpan(
                        text: "Login",
                        style: TextStyle(color: Color(0xff0803FF)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPages();
                            }));
                          })
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color(0xFF008DB9),
        child: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            // TextButton(
            //     onPressed: () {},
            //     child: const Text(
            //       'SignUp',
            //       style: TextStyle(color: Color(0xff0803FF)),
            //     )),

            ElevatedButton(
              onPressed: () {
                try {
                  AuthServicesUsers().signup(
                      _emailcontroller.text,
                      _passwordcontroller.text,
                      _confirmpass.text,
                      _kelas.text,
                      _nisn.text,
                      _username.text,
                      _numberphone.text);
                } catch (e) {
                  print(e);
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff0DABB5),
                  fixedSize: const Size(87, 29),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text('SignUp'),
            )
          ]),
        ),
      ),
    );
  }
}
