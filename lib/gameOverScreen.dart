import 'package:flutter/material.dart';
import 'package:math_master/storeScreen.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'GameSelectionScreen.dart';
import 'PlayGameScreen.dart';
import 'data.dart';
import 'levelScreen.dart';
import 'playMusicScreen.dart';

class gameOverScreen extends StatelessWidget {
  gameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    Column _backButton() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigoAccent, width: 4.0),
              color: Colors.indigo[900],
              // shape: BoxShape.s,
            ),
            child: InkWell(
              //padding:EdgeInsets.all(20.0),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 50,
                    color: color,
                  ),
                  Text(
                    'BACK',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                  ),
                ]),
              ),
              borderRadius: BorderRadius.circular(
                  1000.0), //Something large to ensure a circle
              onTap: () {
                print('đã vào bắt đầu lại trò chơi');
                // Navigator.push(context, route);

                for (var item in stations) {
                  if (item.id == indexLevel) {
                    stations[item.id-1].score = score;
                    stations[item.id].isOpen = true;
                  }
                }
                money = money +score;
                score= 0;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => levelScreen()));
              },
            ),
          ),
        ],
      );
    }

    // Color color1 = HexColor("#283B71");
    // Color color2 = HexColor("#283B71");
    // Color color3 = HexColor("#283B71");
    Color color1 = Colors.grey;
    Color color2 = Colors.grey;
    Color color3 = Colors.grey;
    if (score >= 7000) {
      color1 = HexColor("#283B71");
      color2 = HexColor("#283B71");
      color3 = HexColor("#283B71");
    }
    if (6000 < score && score < 7000) {
      color1 = HexColor("#283B71");
      color2 = HexColor("#283B71");
    }
    if (5000 < score && score < 6000) {
      color1 = HexColor("#283B71");
    }


    return MaterialApp(
        // title: 'Flutter layout Demo',
        theme: ThemeData(
            //   primarySwatch: Colors.blue,
            ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor:ThemeColor,
            appBar: AppBar(
              title: const Text('Flutter layout demo'),
            ),
            body: Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: Column(children: [
                  Text(
                    'GAME OVER',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: HexColor("#283B71"),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    score.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#283B71"),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    //  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: color1,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: color2,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: color3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _backButton(),
                ]))));
  }
}
