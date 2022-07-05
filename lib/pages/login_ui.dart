import 'package:classmeetroom/pages/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Loginpage();
}

class _Loginpage extends State<LoginPages> {
  final TextEditingController mapelcontroler = TextEditingController();
  final TextEditingController hariControler = TextEditingController();
  final TextEditingController jamControler = TextEditingController();

  Color HexColor = Color(0xFF008DB9);
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseconect = FirebaseFirestore.instance;
    CollectionReference mapels = firebaseconect.collection('mapel');
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(children: [
                Text("Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50))
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: mapelcontroler,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: hariControler,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "******",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: jamControler,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                Text("Remember me")
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        mapels.add({
                          'name': mapelcontroler.text,
                          'hari': hariControler.text,
                          'jam': jamControler.text
                        });
                        mapelcontroler.text = '';
                        hariControler.text = '';
                        jamControler.text = '';
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const HomePage();
                        // }));
                      },
                      child: Text("Login")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
