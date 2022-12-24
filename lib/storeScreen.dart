import 'package:flutter/material.dart';
import 'package:math_master/MenuScreen.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'GameSelectionScreen.dart';
import 'PlayGameScreen.dart';
import 'levelScreen.dart';
import 'playMusicScreen.dart';

int numberStar = 10;
int money = 7000;



class storeScreen extends StatelessWidget {
  storeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Color color = ThemeColor;



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
                print('đã vào trở về menu chính');
                // Navigator.push(context, route);

                score = 0;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => menuScreen()));
              },
            ),
          ),
        ],
      );
    }





    return MaterialApp(
        // title: 'Flutter layout Demo',
        theme: ThemeData(
            //   primarySwatch: Colors.blue,
            ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: Column(children: [
                  Text(
                    'GAME STORE',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: HexColor("#283B71"),
                    ),
                  ),
                  Row(
                    //  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.star,
                        size: 40,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Text(
                      'Money: ${money}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#283B71"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: HexColor("#283B71"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),

                        child: Text(
                          'Hope star',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: HexColor("#283B71"),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          '5000 score',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: HexColor("#283B71"),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                        child: Text(
                          'x${numberStar}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: HexColor("#283B71"),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                        child: OutlinedButton(
                          child: Text(
                            "BUY",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.indigo[900],
                            ),
                          ),
                          onPressed: () {
                            if(money>5001){
                              numberStar++;
                              money = money-5000;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => storeScreen()));
                            }

                          },
                        ),
                      ),
                    ],
                  ),
                  _backButton(),
                ]))));
  }
}
