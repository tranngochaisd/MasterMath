import 'package:flutter/material.dart';
import 'package:math_lord/playGameScreen.dart';
import 'package:math_lord/progressBar.dart';
import 'package:math_lord/seletcGameScreen.dart';
import 'package:math_lord/singInScreen.dart';

import 'leverScreen.dart';
import 'test/listViewTest2.dart';
import 'maneScreen.dart';
import 'test/tesrListView.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
