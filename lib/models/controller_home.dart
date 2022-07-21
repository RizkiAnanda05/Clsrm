import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getdatamapel(String DocID) async {
    DocumentReference datamapel =
        FirebaseFirestore.instance.collection('mapel').doc(DocID);
    return datamapel.get();
  }
}
