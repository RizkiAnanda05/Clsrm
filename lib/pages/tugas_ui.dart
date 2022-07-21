import 'package:classmeetroom/databases/db_helper.dart';
import 'package:classmeetroom/models/controller_home.dart';
import 'package:classmeetroom/models/detailmapelmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tugas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Tugas();
}

class _Tugas extends State<Tugas> {
  // Future<List<DetailMapelModel>>? mapelgetdetail;
  // List<DetailMapelModel>? MapeldetailList;
  Db_Helper service = Db_Helper();
  Future<List<DetailMapelModel>>? getdetailmapels;
  List<DetailMapelModel>? Modeldetail;
  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    getdetailmapels = service.retrieveMapelDetail(Get.arguments.id.toString());
    Modeldetail = await service.retrieveMapelDetail(Get.arguments.id);
  }

  Color hexcolor = Color(0xFF008DB9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments.name.toString()),
      ),
      backgroundColor: hexcolor,
      body: FutureBuilder(
          future: getdetailmapels,
          builder: (BuildContext context,
              AsyncSnapshot<List<DetailMapelModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: Modeldetail!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Modeldetail![index].tugastitle.toString()),
                          Row(
                            children: [
                              Flexible(
                                  child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${Modeldetail![index].deskrispi}',
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
                                    elevation: 2,
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: const Text("Upload",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Container(
                // margin: const EdgeInsets.all(15.0),
                // padding: const EdgeInsets.all(3.0),
                width: 349,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white),
                child: Column(children: [
                  Text(''),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '',
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
              );
            }

            // return Center(
            //   child: CircularProgressIndicator(),
            // );
          }),

      // Text(
      //   'Bahasa Indonesia',
      //   style: TextStyle(fontSize: 24),
      // ),
      // SizedBox(
      //   height: 30,
      // ),
      // Text('Tugas'),
    );
  }
}
