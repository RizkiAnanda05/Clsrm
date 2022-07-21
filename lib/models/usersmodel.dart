import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  String? name;
  String? kelas;
  String? nisn;
  int? phone;
  String? photouser;
  User({this.id, this.name, this.kelas, this.nisn, this.phone, this.photouser});
  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //       id: json['id'],
  //       name: json['name'],
  //       kelas: json['class'],
  //       nisn: json['nisn']);
  // }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'kelas': kelas,
      'nisn': nisn,
      'phone': phone,
      'photos': photouser
    };
  }

  User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!['name'],
        kelas = doc.data()!['kelas'],
        nisn = doc.data()!['nisn'],
        phone = doc.data()!['phone'],
        photouser = doc.data()!['photos'];
}
