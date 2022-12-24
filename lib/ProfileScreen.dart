//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_master/MenuScreen.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>{
  String? name = '';
  String? email = '';
  String? image = '';
  String? phone = '';
  //File? imageXFile ;

  Future _getDataFromDatabase() async
  {
    await FirebaseFirestore.instance.collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async
    {
      if(snapshot.exists)
        {
          setState(() {
            name = snapshot.data()!["name"];
            email = snapshot.data()!["email"];
            image = snapshot.data()!["userImage"];
            phone = snapshot.data()!["phoneNumber"];
          });
        }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red,Colors.deepOrange.shade300],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.2,0.9],
            ),
          ),
        ),
        centerTitle: true,
          backgroundColor: Colors.blue.shade400,
        title: const Center(
          child: Text('Profile Screen',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> menuScreen()));
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink,Colors.deepOrange.shade300],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.2,0.5],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                //showImage
    },
    // child: CircleAvatar(
    // backgroundColor: Colors.amberAccent,
    // minRadius: 60.0,
    // child: CircleAvatar(
    // radius: 55.0,
    // backgroundImage: imageXFile == null
    //     ?
    //     NetworkImage(
    //         image!
    //     )
    //     :
    //     Image.file
    //         (imageXFile!).image,
    // ),
    // ),
            ),
            const SizedBox(height: 5.0,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name : ' + name!,style: const TextStyle(fontSize: 5.0,fontWeight: FontWeight.bold,color: Colors.white),),
              IconButton(onPressed: () {
                //dislay
              }, icon: const Icon(Icons.edit))
              ],
            ),
            const SizedBox(height: 5.0,),
            Text('email : ' + email!,style: const TextStyle(fontSize: 5.0,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}