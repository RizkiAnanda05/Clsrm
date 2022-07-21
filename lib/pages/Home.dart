import 'package:classmeetroom/databases/db_helper.dart';
import 'package:classmeetroom/databases/user_auth_services.dart';
import 'package:classmeetroom/models/controller_home.dart';
import 'package:classmeetroom/models/mapel_model.dart';
import 'package:classmeetroom/pages/pelajaran_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homepage();
}

class _homepage extends State<HomePage> {
  final users = FirebaseAuth.instance.currentUser!;
  // final List<Mapelmodel> mapels = [];
  // final Db_Helper db_helper = Db_Helper();
  //final Stream<QuerySnapshot> _users =
  //  FirebaseFirestore.instance.collection('mapel').snapshots();
  final getuser = HomeController().firestore.collection('users');
  Future<List<Mapelmodel>>? retrievedMapelslist;
  List<Mapelmodel>? MapelList;
  Db_Helper service = Db_Helper();

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    retrievedMapelslist = service.retrieveMapel();
    MapelList = await service.retrieveMapel();
    print(MapelList);
  }

  Color HexColor = const Color(0xFF008DB9);

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
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Selamat Datang",
                        style: TextStyle(fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                FutureBuilder<DocumentSnapshot<Object?>>(
                                  future: AuthServicesUsers()
                                      .getdatauser(users.uid),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      // var data = snapshot.data!.data();
                                      // print(AuthServicesUsers()
                                      //     .getdatauser(users.uid)
                                      //     .toString());

                                      // return Text(data.toString());

                                      var data = snapshot.data!.data()
                                          as Map<String, dynamic>;
                                      snapshot.data!;
                                      // ignore: avoid_unnecessary_containers
                                      return Container(
                                        margin: EdgeInsets.only(left: 24),
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              data['name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            Text(
                                              data['nisn'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              data['phone'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              data['kelas'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            )
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Positioned(
                top: 70,
                child: Container(
                  width: 80,
                  height: 80,
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
          Expanded(
            child: Scaffold(
                body: RefreshIndicator(
              onRefresh: _initRetrieval,
              child: FutureBuilder(
                  future: retrievedMapelslist,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Mapelmodel>> snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      print(snapshot.data);
                      return ListView.separated(
                        itemCount: MapelList!.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () => Get.toNamed('/Mapel',
                                arguments: MapelList![index]),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            title: Text(
                              '${MapelList![index].name}',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            subtitle: Text('${MapelList![index].teachname}'),
                            trailing: const Icon(Icons.arrow_right_sharp),
                          );
                        },
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        MapelList!.isEmpty) {
                      return Center(
                        child: ListView(
                          children: const <Widget>[
                            Align(
                                alignment: AlignmentDirectional.center,
                                child: Text('No data available')),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            )),
          ),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
