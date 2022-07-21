import 'package:cloud_firestore/cloud_firestore.dart';

class Mapelmodel {
  final String? id;
  final String? name;
  final String? teachname;
  final String? hari;
  final String? jam;
  Mapelmodel({
    this.id,
    required this.name,
    required this.teachname,
    required this.hari,
    required this.jam,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'teachname': teachname, 'hari': hari, 'jam': jam};
  }

  Mapelmodel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!['name'],
        teachname = doc.data()!['teachname'],
        hari = doc.data()!['hari'],
        jam = doc.data()!['jam'];
}
