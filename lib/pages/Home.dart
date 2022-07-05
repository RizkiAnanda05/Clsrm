import 'package:classmeetroom/Colors/colorshex.dart';
import 'package:classmeetroom/models/controller_home.dart';
import 'package:classmeetroom/models/mapel_model.dart';
import 'package:classmeetroom/pages/pelajaran_ui.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../databases/db_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homepage();
}

class _homepage extends State<HomePage> {
  final List<Mapelmodel> mapels = [];
  final Db_Helper db_helper = Db_Helper();
  final List<Mapelmodel> sampledata = [
    Mapelmodel(
        id: 1,
        name: 'Matematika',
        teachname: 'Rizki Ananda',
        hari: 'Senin',
        jam: '07:00')
  ];

  Future<void> getAllmapels() async {
    mapels.clear();
    await db_helper.getAllmapels().then((value) {
      (value as List).forEach((json) {
        mapels.add(Mapelmodel.fromJson(json));
      });
    });
    setState(() {});
  }

  @override
  void initstate() {
    super.initState();
    getAllmapels();
  }

  Color HexColor = Color(0xFF008DB9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Selamat Datang",
                          style: TextStyle(fontSize: 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),

                                  // Text(
                                  //   "Hello User1",
                                  //   style: TextStyle(fontSize: 20),
                                  // ),
                                  Text("Nisn"),
                                  Text("Class")
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Positioned(
                  top: 100,
                  child: Container(
                    width: 120,
                    height: 120,
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
            Expanded(
                child: ListView.builder(
              itemCount: mapels.length,
              itemBuilder: (context, index) {
                Mapelmodel mapelmodel = mapels[index];
                return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    height: 150,
                    color: Colors.white,
                    child: Text("${mapelmodel.name}"));
              },
            )),
            // Column(
            //   children: [
            //     Container(
            //         margin: EdgeInsets.only(bottom: 10),
            //         width: double.infinity,
            //         height: 150,
            //         color: Colors.white,
            //         child: TextButton(
            //           style: TextButton.styleFrom(
            //               elevation: 2, backgroundColor: Colors.white),
            //           onPressed: () {
            //             var value = 'Matematika';
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => Mapel(
            //                           value: value,
            //                         )));
            //           },
            //           child: const Text("Matematika"),
            //         )),
            //     Container(
            //         margin: EdgeInsets.only(bottom: 10),
            //         width: double.infinity,
            //         height: 150,
            //         color: Colors.white,
            //         child: TextButton(
            //           style: TextButton.styleFrom(
            //               elevation: 2, backgroundColor: Colors.white),
            //           onPressed: () {
            //             var value = 'Bahasa Indonesia';
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => Mapel(
            //                           value: value,
            //                         )));
            //           },
            //           child: const Text("Bahasa Indonesia"),
            //         )),
            //     Container(
            //         margin: EdgeInsets.only(bottom: 10),
            //         width: double.infinity,
            //         height: 150,
            //         color: Colors.white,
            //         child: TextButton(
            //           style: TextButton.styleFrom(
            //               elevation: 2, backgroundColor: Colors.white),
            //           onPressed: () {
            //             var value = 'Bahasa Inggris';
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => Mapel(
            //                           value: value,
            //                         )));
            //           },
            //           child: const Text("Bahasa Inggris"),
            //         )),
            //     Container(
            //       margin: EdgeInsets.only(bottom: 10),
            //       width: double.infinity,
            //       height: 150,
            //       color: Colors.white,
            //       child: TextButton(
            //         style: TextButton.styleFrom(
            //             elevation: 2, backgroundColor: Colors.white),
            //         onPressed: () {
            //           var value = 'IPA';
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => Mapel(value: value)));
            //         },
            //         child: const Text("IPA"),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ));
  }
}
