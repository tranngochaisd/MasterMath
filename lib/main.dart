import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:math_master/ProfileScreen.dart';

import 'GameSelectionScreen.dart';
import 'MenuScreen.dart';
import 'package:flame_audio/flame_audio.dart';
import 'PlayGameScreen.dart';
import 'SingIn.dart';
import 'gameOverScreen.dart';
import 'holyBattleScreen.dart';
import 'overBattleP1.dart';
import 'playMusicScreen.dart';
import 'rigisterScreen2.dart';
import 'storeScreen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // .holt@reqres.in cityslicka
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
