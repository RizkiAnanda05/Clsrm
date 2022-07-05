import 'dart:collection';
import 'dart:math';

import 'package:classmeetroom/databases/db_helper.dart';
import 'package:classmeetroom/models/controller_home.dart';
import 'package:classmeetroom/models/mapel_model.dart';
import 'package:classmeetroom/pages/Home.dart';
import 'package:classmeetroom/pages/tugas_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mapel extends StatefulWidget {
  String value;
  Mapel({required this.value});
  @override
  State<StatefulWidget> createState() => _mapels(value: value);
}

class _mapels extends State<Mapel> {
  String value;
  _mapels({required this.value});

  Color hexColor = Color(0xFF008DB9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexColor,
      body: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              width: double.infinity,
              height: 250,
              child: Container(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(""),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Senin"),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("08:30"),
                  ),
                ]),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage('assets/images/onboard_image.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          width: double.infinity,
          height: 54,
          color: Colors.white,
          alignment: Alignment(0.0, 0.0),
          child: TextButton(
            style: TextButton.styleFrom(
                elevation: 2, backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Tugas();
              }));
            },
            child: const Text("Tugas",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          width: double.infinity,
          height: 54,
          color: Colors.white,
          alignment: Alignment(0.0, 0.0),
          child: TextButton(
            style: TextButton.styleFrom(
                elevation: 2, backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: const Text("Buku",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          width: double.infinity,
          height: 54,
          color: Colors.white,
          alignment: Alignment(0.0, 0.0),
          child: TextButton(
            style: TextButton.styleFrom(
                elevation: 2, backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: const Text("Nilai",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        ),
      ]),
    );
  }
}
