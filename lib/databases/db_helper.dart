import 'dart:async';
import 'dart:io';
import 'package:classmeetroom/models/detailmapelmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../models/mapel_model.dart';

class Db_Helper {
  final FirebaseFirestore _dbHelper = FirebaseFirestore.instance;
  File? image;

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
    await _dbHelper
        .collection('users')
        .add({'kelas': kelas, 'name': name, 'nisn': nisn, 'phone': phone});
  }

//   Future UploadImage(File Imagefile) async {
//     String filename = basename(Imagefile.path);
//     final storageRef = FirebaseStorage.instance.ref();

// // Create a reference to "mountains.jpg"
//     final mountainsRef = storageRef.child("mountains.jpg");

// // Create a reference to 'images/mountains.jpg'
//     final mountainImagesRef = storageRef.child("images/mountains.jpg");

// // While the file names are the same, the references point to different files
//     assert(mountainsRef.name == mountainImagesRef.name);
//     assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
//     return ;
//   }
}
