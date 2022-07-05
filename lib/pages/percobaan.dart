import 'package:classmeetroom/Colors/colorshex.dart';
import 'package:classmeetroom/models/controller_home.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Percobaan extends StatefulWidget {
  const Percobaan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _homepage();
}

class _homepage extends State<Percobaan> {
  Color HexColor = Color(0xFF008DB9);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseconect = FirebaseFirestore.instance;
    CollectionReference mapels = firebaseconect.collection('mapel');

    return Scaffold(
      backgroundColor: HexColor,
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: HomeController().streamdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var getalldatamapel = snapshot.data!.docs;
            return ListView.builder(
              itemCount: getalldatamapel.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    "${(getalldatamapel[index].data() as Map<String, dynamic>)["name"]}"),
                tileColor: Colors.white,
                subtitle: Text(
                    "${(getalldatamapel[index].data() as Map<String, dynamic>)["hari"]}"),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

            // Stack(
            //   clipBehavior: Clip.none,
            //   alignment: Alignment.topRight,
            //   children: [
            //     Container(
            //         margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            //         width: double.infinity,
            //         height: 250,
            //         child: Column(
            //           children: [
            //             SizedBox(
            //               height: 20,
            //             ),
            //             Text("Selamat Datang"),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Center(
            //                   child: Column(
            //                     children: [
            //                       SizedBox(
            //                         height: 100,
            //                       ),

            //                       // Text(
            //                       //   "Hello User1",
            //                       //   style: TextStyle(fontSize: 20),
            //                       // ),
            //                       Text("NIsn"),
            //                       Text("Class")
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             )
            //           ],
            //         )),
            //     Positioned(
            //       top: 100,
            //       child: Container(
            //         width: 120,
            //         height: 120,
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.white, width: 5),
            //           borderRadius: BorderRadius.circular(100),
            //           image: DecorationImage(
            //               image: AssetImage('assets/images/onboard_image.png'),
            //               fit: BoxFit.cover),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Column(
            //   children: [
            //     Container(
            //       margin: EdgeInsets.only(bottom: 10),
            //       width: double.infinity,
            //       height: 150,
            //       color: Colors.white,
            //       child: Text(
            //         "Matematika",
            //         style: TextStyle(fontSize: 20),
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(bottom: 10),
            //       width: double.infinity,
            //       height: 150,
            //       color: Colors.white,
            //       child:
            //           Text("Bahasa Indonesia", style: TextStyle(fontSize: 20)),
            //     ),
            //     Container(
            //         margin: EdgeInsets.only(bottom: 10),
            //         width: double.infinity,
            //         height: 150,
            //         color: Colors.white,
            //         child: Column(
            //           children: [
            //             Text("Inggris", style: TextStyle(fontSize: 20)),
            //             Text("Senin"),
            //             Text("07:00-08:30")
            //           ],
            //         )),
            //   ],
            // )