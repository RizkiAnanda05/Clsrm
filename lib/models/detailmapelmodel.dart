import 'package:cloud_firestore/cloud_firestore.dart';

class DetailMapelModel {
  final String? id;
  final String? deskrispi;
  final String? tugastitle;
  DetailMapelModel(
      {this.id, required this.deskrispi, required this.tugastitle});

  Map<String, dynamic> toMap() {
    return {'deskripsi': deskrispi, 'tugas_title': tugastitle};
  }

  DetailMapelModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        deskrispi = doc.data()!['deskripsi'],
        tugastitle = doc.data()!['tugas_title'];
}
