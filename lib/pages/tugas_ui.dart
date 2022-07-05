import 'package:flutter/material.dart';

class Tugas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Tugas();
}

class _Tugas extends State<Tugas> {
  Color hexcolor = Color(0xFF008DB9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: hexcolor,
        body: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          width: double.infinity,
          child: ListView(
            children: [
              Text(
                'Bahasa Indonesia',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Tugas'),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                width: 349,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white),
                child: Column(children: [
                  Text('Tugas 1'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "mengarang ",
                          maxLines: 2,
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Anda Belum Upload Tugas Ini',
                        style: TextStyle(fontSize: 10),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            elevation: 2, backgroundColor: Colors.white),
                        onPressed: () {},
                        child: const Text("Upload",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black)),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
