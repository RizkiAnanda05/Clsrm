// ignore_for_file: avoid_unnecessary_containers

import 'package:classmeetroom/databases/user_auth_services.dart';
import 'package:classmeetroom/pages/Home.dart';
import 'package:classmeetroom/pages/signup_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Loginpage();
}

class _Loginpage extends State<LoginPages> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
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
                  "Login",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 111,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Usename",
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
                      border: InputBorder.none,
                    ),
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
                    style: TextStyle(color: Colors.black54),
                    obscureText: true,
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color(0xFF008DB9),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
              onPressed: () {
                Get.toNamed('/SignUp');
              },
              child: const Text(
                'SignUp',
                style: TextStyle(color: Color(0xff0803FF)),
              )),
          ElevatedButton(
            onPressed: () {
              try {
                AuthServicesUsers()
                    .signin(_emailcontroller.text, _passwordcontroller.text);
                print(_emailcontroller);
              } catch (e) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(e.toString()),
                      );
                    });
              }
            },
            style: ElevatedButton.styleFrom(
                primary: const Color(0xff0DABB5),
                fixedSize: const Size(87, 29),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Text('Login'),
          )
        ]),
      ),
    );
  }
}
