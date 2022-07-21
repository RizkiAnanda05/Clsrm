import 'package:classmeetroom/databases/db_helper.dart';
import 'package:classmeetroom/models/controller_home.dart';
import 'package:classmeetroom/models/mapel_model.dart';
import 'package:classmeetroom/pages/Home.dart';
import 'package:classmeetroom/pages/tugas_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mapel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _mapels();
}

class _mapels extends State<Mapel> {
  Color hexColor = Color(0xFF008DB9);
  var getmapeldata = HomeController().getdatamapel(Get.arguments.id);
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
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 20),
                child: Column(children: [
                  FutureBuilder<DocumentSnapshot>(
                    future: HomeController().getdatamapel(Get.arguments.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        print(Get.arguments);
                        var data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        snapshot.data!;

                        return Column(
                          children: [
                            // const SizedBox(
                            //   height: 30,
                            // ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data['name'],
                                  style: Theme.of(context).textTheme.titleLarge,
                                )),
                            const SizedBox(
                              height: 24,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data['teachname'],
                                  style: Theme.of(context).textTheme.titleSmall,
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data['hari'],
                                  style: Theme.of(context).textTheme.titleSmall,
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data['jam'],
                                  style: Theme.of(context).textTheme.titleSmall,
                                )),

                            GestureDetector(
                              onTap: () => Get.toNamed(
                                '/detail',
                                arguments: Get.arguments,
                              ),
                              child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  width: double.infinity,
                                  height: 54,
                                  color: Colors.white,
                                  alignment: const Alignment(0.0, 0.0),
                                  child: const Text('Tugas',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black))),
                            ),
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              width: double.infinity,
                              height: 54,
                              color: Colors.white,
                              alignment: const Alignment(0.0, 0.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }));
                                },
                                child: const Text("Buku",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              width: double.infinity,
                              height: 54,
                              color: Colors.white,
                              alignment: const Alignment(0.0, 0.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }));
                                },
                                child: const Text("Nilai",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ]),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/onboard_image.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
