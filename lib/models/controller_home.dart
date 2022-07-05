import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Future<QuerySnapshot<Object?>>> getData() async {
    CollectionReference mapels = firestore.collection("Users");

    return mapels.get();
  }

  Stream<QuerySnapshot<Object?>> streamdata() {
    CollectionReference mapels = firestore.collection("mapel");

    return mapels.snapshots();
  }
}
