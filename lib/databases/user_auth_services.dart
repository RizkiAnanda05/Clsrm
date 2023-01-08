import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthServicesUsers {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();
  // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  Future signin(_email, _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email.toString().trim(),
          password: _password.toString().trim());
    } catch (e) {
      print(e);
    }
  }

  Future signup(String email, String password, String confirmpass, String kelas,
      String nisn, String name, String phone) async {
    if (password == confirmpass) {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set({
          'kelas': kelas.trim(),
          'name': name.trim(),
          'nisn': nisn.trim(),
          'phone': phone.trim()
        });
      });
    } else {
      print('Password doesnt pass');
    }
  }

  Future<DocumentSnapshot> getdatauser(String DocID) async {
    var datamapel = FirebaseFirestore.instance.collection('users').doc(DocID);
    return datamapel.get();
  }

  Future uploadImage(File imagefile, String idUser) async {
    String filename = basename(imagefile.path);

    final storageRef =
        FirebaseStorage.instance.ref().child('files/' + filename);
    UploadTask uploadTask = storageRef.putFile(imagefile);
    TaskSnapshot snapshot = await uploadTask;

    String profileurl = await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .update({'image': profileurl});
  }
}
