import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_master/main.dart';

// class Forget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return Rigister();
//   }
// }

class Rigister extends StatelessWidget{
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtRePass = TextEditingController();
  String name = '';
  String avatar = '';
  String coverImage = '';
  String phone = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: Text('Đăng ký tài khoản'),),
      body: Container(

        //decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('images/AppBarBack.jpg'), fit: BoxFit.fill),
        // ),

        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Đăng Ký',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,

            ),
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 6),
              child: TextField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Nhập email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 12),
              child: TextField(
                controller: txtPass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nhập password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 12),
              child: TextField(
                controller: txtRePass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nhập lại password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final User? user = auth.currentUser;
                  final uid = user?.uid;
                  final newUser = auth
                      .createUserWithEmailAndPassword(
                      email: txtEmail.text, password: txtPass.text)
                      .then((value) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .set({
                      "email": value.user?.email,
                      "id": uid,
                      "name": name,
                      "coverImage": coverImage,
                      "avatar": avatar,
                      "phone": phone,
                    });
                  });
                  if (newUser != null) {
                    Navigator.pop(context, 'Đăng Ký Thành Công!');
                  } else {
                    final snackBar =
                    SnackBar(content: Text('Tài khoản này không hợp lệ!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (e) {
                  final snackBar = SnackBar(content: Text('Có lỗi xảy ra!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text(
                'Đăng Ký',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 98, 0))),

            ),
          ],
        ),
      ),
    );

  }
}