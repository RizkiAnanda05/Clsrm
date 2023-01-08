import 'dart:io';

import 'package:classmeetroom/databases/db_helper.dart';
import 'package:classmeetroom/databases/user_auth_services.dart';
import 'package:classmeetroom/models/usersmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _image;
  String? Imagepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: (_image != null)
                            ? Image.file(
                                _image!,
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWQ2QobXwosj_esiqUwoeomdFbsWQO4hcGkA&usqp=CAU',
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ))),
          IconButton(
              onPressed: () async {
                // AuthServicesUsers().Opencam();
                // pickImage();
                pickImage();
                setState(() {});
              },
              icon: Icon(Icons.camera_alt)),
          FutureBuilder<DocumentSnapshot<Object?>>(
              future: AuthServicesUsers().getdatauser(Get.arguments.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  return Text(data['name']);
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text("Logout")),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      AuthServicesUsers().uploadImage(imageTemp, Get.arguments.toString());
      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
