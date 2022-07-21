import 'dart:async';
import 'package:classmeetroom/models/detailmapelmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/mapel_model.dart';

class Db_Helper {
  final FirebaseFirestore _dbHelper = FirebaseFirestore.instance;

  Future<List<Mapelmodel>> retrieveMapel() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _dbHelper.collection('mapel').get();
    return snapshot.docs
        .map((docSnapshot) => Mapelmodel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<DocumentSnapshot> getdatamapel(String DocID) async {
    DocumentReference datamapel =
        FirebaseFirestore.instance.collection('mapel').doc(DocID);
    return datamapel.get();
  }

  Future<Stream<DocumentSnapshot<Object?>>> getdataDetail(String DocID) async {
    DocumentReference datamapel = FirebaseFirestore.instance
        .collection('mapel')
        .doc(DocID)
        .collection('detail')
        .doc();
    return datamapel.snapshots();
  }

  Future<List<DetailMapelModel>> retrieveMapelDetail(String DocId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _dbHelper
        .collection('mapel')
        .doc(DocId)
        .collection('detail')
        .get();
    return snapshot.docs
        .map(
            (docSnapshot) => DetailMapelModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future Adduserdata(
      String kelas, String nisn, String name, String phone) async {
    await _dbHelper.collection('users').add({
      'kelas': kelas,
      'name': name,
      'nisn' : nisn,
      'phone': phone
    });
  }
}
