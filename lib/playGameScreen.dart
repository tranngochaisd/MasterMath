import 'dart:math';
import 'dart:async';

import "package:flutter/material.dart";
import 'package:math_lord/seletcGameScreen.dart';

var h;
var w;
minMax m = new minMax(0, 0);
const duration = const Duration(milliseconds: 10);
mix Mix = new mix(0, 0, 0, 0);

int soTren = 0;
int soDuoi = 0;
int score = 0;
int updateScore = 0;
int answered = 0;
Color color = Colors.white;
Color colorIdigo = Color.fromARGB(255, 24, 31, 109);

class gamePlayScreen extends StatefulWidget {
  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _value {
  int id;
  bool istrue = false;

  _value(this.id, this.istrue);
}

class StateCheckBox extends StatelessWidget {
  StateCheckBox({Key? key, required this.item}) : super(key: key);
  final _value item;
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 0.5,
        child: Checkbox(
            checkColor: Colors.white,
            activeColor: colorIdigo,
            value: item.istrue,
            onChanged: (bool? value) {}));
  }
  // onChanged: null,

}

// Thanh tiến trình

Widget apparColumn(Color color, IconData icon, String label, String score,
    BuildContext context) {
  bool valuefirst = false;
  bool valuesecond = false;
  return Row(children: [
    BackButtonColumn(Colors.black, Icons.exit_to_app, '', 30, context),
    Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LEVEL',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
              Text(
                'TYPE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
              Text(
                'SCORE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              )
            ],
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/AppBarBack.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // BackButtonColumn(
                //     Colors.white, Icons.exit_to_app, '', 40, context),
                Container(
                  // padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  width: 150,

                  alignment: Alignment.center,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: 50,
                    color: color,
                  ),
                ),
                Container(
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      score,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ))
              ],
            ),
          ),
        ])
  ]);
}

Widget BackButtonColumn(Color color, IconData icon, String label, double _size,
    BuildContext context) {
  return Container(
      //color: Colors.indigo[900],
      // width: 100,
      //height: 50,
      padding: EdgeInsets.fromLTRB(0, 15, 30, 0),
      alignment: Alignment.center,
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bbground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          //padding: EdgeInsets.all(20.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Icon(
                icon,
                size: _size,
                color: Colors.white,
              ),
            ]),
          ),
          borderRadius: BorderRadius.circular(
              1000.0), //Something large to ensure a circle
          onTap: () {
            print('Hai Hai Hai Hung Hung Hung');
            // Navigator.push(context, route);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => gameSelection()));
          },
        ),
      ));
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.indigo[900],
    border: Border(
      right: BorderSide(
        //                   <--- left side
        color: Colors.black,
        width: 3.0,
      ),
      // top: BorderSide(
      //   //                    <--- top side
      //   color: Colors.black,
      //   width: 3.0,
      // ),
    ),
  );
}

class _HomePageState2 extends State<gamePlayScreen> {
  List<_value> Value1 = [
    _value(1, false),
    _value(2, false),
    _value(3, false),
    _value(4, false),
    _value(5, false),
    _value(6, false),
    _value(7, false),
    _value(8, false),
    _value(9, false),
    _value(10, false),
    _value(11, false),
    _value(12, false),
    _value(13, false),
    _value(14, false),
    _value(15, false),
  ];

  late bool _loading;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    answered = 0;
    _loading = false;
    _progressValue = 1.0;
    _loading = !_loading;

    _updateProgress();
    handlerGamePlaye(10, 100, m);
    soTren = m.a;
    soDuoi = m.b;
    Mix = mixAnswer(m.a + m.b);
    print('da vao init');
    //_incrementScore();
  }

  void _updateProgress() {
    var oneSec = const Duration(milliseconds: 10);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        var timeSpeed = 0.001;
        _progressValue -= timeSpeed;
        if (_progressValue.toStringAsFixed(1) == '0') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
    // void dispose() {
    //   _timer.cancel();
    //   super.dispose();
    // }
  }

  int questionNumber = 0;

  int _incrementScore() {
    if (updateScore != score) {
      setState(() {
        score = score + updateScore;
        updateScore = 0;
        questionNumber++;
        for (var i in Value1) {
          if (i.id == questionNumber) {
            i.istrue = true;
          }
        }
        print('da vao _incrementScore');
        answered = 0;
        _loading = !_loading;
        const Duration x = const Duration(milliseconds: 1000);
        // dispose();
        _updateProgress();
        handlerGamePlaye(10, 100, m);
        // answered = 0;
        print('da vao answered = ' + _progressValue.toString());
        _progressValue = 1.0;
        print('da vao answered = ' + _progressValue.toString());
        soTren = m.a;
        soDuoi = m.b;
        Mix = mixAnswer(soTren + soDuoi);
        // _loading = !_loading;
        // const Duration x = const Duration(milliseconds: 1000);
        // _updateProgress();
      });
    }
    return score;
  }

  Widget answerButtonColumn(
    Color color,
    String label,
    double _size,
    int code,
  ) {
    return Container(
        //color: Colors.indigo[900],
        child: Ink(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigoAccent, width: 4.0),
        color: Colors.indigo[900],
      ),
      child: InkWell(
        //padding:EdgeInsets.all(20.0),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Text(
              label,
              style: TextStyle(
                fontSize: _size,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            )
          ]),
        ),
        borderRadius:
            BorderRadius.circular(1000.0), //Something large to ensure a circle
        onTap: () {
          if (code != 1) {
            updateScore = updateScore - 100;
            answered = 1;
            _incrementScore();

            print('Dap an sai ' + score.toString());
          } else {
            updateScore = updateScore + 450;
            answered = 1;
            _incrementScore();
            print('Dap an dung ' + score.toString());
            // setState(() {
            //   _text = 'The text is updated';
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => gameSelection()));
            // });
            // updateScore = score + 450;
          }
        },
      ),
    ));
  }

  Padding answer(
    int A,
    int B,
    int C,
    int x,
  ) {
    int a = 0, b = 0, c = 0;
    if (x == 1) {
      a = 1;
    }
    if (x == 2) {
      b = 1;
    }
    if (x == 3) {
      c = 1;
    }
    return Padding(
        padding: EdgeInsets.fromLTRB(80, 100, 80, 120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            answerButtonColumn(
              color,
              A.toString(),
              30,
              a,
            ),
            answerButtonColumn(
              color,
              B.toString(),
              30,
              b,
            ),
            answerButtonColumn(
              color,
              C.toString(),
              30,
              c,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // handlerGamePlaye(10, 100, m);
    // // soTren = m.a;
    // // soDuoi = m.b;

    // Mix = mixAnswer(soTren + soDuoi);

    IconData icon = Icons.add;
    String Score = score.toString();
    String label = '1';

    double _size = 30;
    //int code;

    int aA = 0, bB = 0, cC = 0;
    if (Mix.x == 1) {
      aA = 1;
    }
    if (Mix.x == 2) {
      bB = 1;
    }
    if (Mix.x == 3) {
      cC = 1;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Checkbox Example'),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //  apparColumn(color, Icons.add, '1', score.toString(), context),

                Row(children: [
                  BackButtonColumn(
                      Colors.black, Icons.exit_to_app, '', 40, context),
                  Column(
                      //  mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 125,
                                child: Text(
                                  'LEVEL',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: colorIdigo,
                                  ),
                                ),
                              ),
                              Container(
                                width: 125,
                                alignment: Alignment.center,
                                child: Text(
                                  'TYPE',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: colorIdigo,
                                  ),
                                ),
                              ),
                              Container(
                                  width: 150,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'SCORE',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: colorIdigo,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: 410,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/AppBarBack.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // BackButtonColumn(
                              //     Colors.white, Icons.exit_to_app, '', 40, context),
                              Container(
                                // padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                width: 150,

                                alignment: Alignment.center,
                                child: Text(
                                  label,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: color,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                child: Icon(
                                  icon,
                                  size: 50,
                                  color: color,
                                ),
                              ),
                              Container(
                                  width: 150,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    Score,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: color,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          width: 410,
                          // height: 10,
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: LinearProgressIndicator(
                            minHeight: 8,
                            backgroundColor: Colors.blue,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(colorIdigo),
                            value: _progressValue,
                          ),
                        ),
                      ])
                ]),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   width: 10,
                    // ),
                  ],
                ),
                // Text(
                //   'PROGRESS',
                //   style: TextStyle(fontSize: 17.0),
                // ),
                Expanded(
                    //flex: 10,
                    child: GridView.count(
                  crossAxisCount: 15,
                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  children: Value1.map((item) {
                    return StateCheckBox(item: item);
                  }).toList(),
                )),

                question(soTren, soDuoi),
                answer(
                  Mix.a,
                  Mix.b,
                  Mix.c,
                  Mix.x,
                ),
              ],
            )),
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label,
    double _size, BuildContext context) {
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
                icon,
                size: _size,
                color: color,
              ),
              Text(
                label,
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
            print('Hai Hai Hai Hung Hung Hung');
            // Navigator.push(context, route);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => ()));
          },
        ),
      ),
    ],
  );
}

Widget answerButtonColumn(
  Color color,
  String label,
  double _size,
  int code,
  int _incrementScore(),
  void _updateProgress(),
) {
  return Container(
      //color: Colors.indigo[900],
      child: Ink(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.indigoAccent, width: 4.0),
      color: Colors.indigo[900],
    ),
    child: InkWell(
      //padding:EdgeInsets.all(20.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          Text(
            label,
            style: TextStyle(
              fontSize: _size,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          )
        ]),
      ),
      borderRadius:
          BorderRadius.circular(1000.0), //Something large to ensure a circle
      onTap: () {
        if (code != 1) {
          answered = 1;

          updateScore = updateScore - 100;
          _incrementScore();
          // print('Dap an sai' + score.toString());
        } else {
          answered = 1;
          updateScore = updateScore + 450;
          _incrementScore();
          print('Dap an dung ' + score.toString());
        }
      },
    ),
  ));
}

Color color2 = Color.fromARGB(255, 25, 34, 133);
Column question(
  int A,
  int B,
) {
  String a = A.toString();
  String b = B.toString();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          a,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            color: color2,
          ),
        ),
      ),
      Icon(
        Icons.add,
        size: 50,
        color: color2,
      ),
      Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          b,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            color: color2,
          ),
        ),
      ),
    ],
  );
}

// Cấu trúc xử lý

mix mixAnswer(int a) {
  mix Mix = new mix(0, 0, 0, 0);
  Mix.x = random(1, 4);
  if (Mix.x == 1) {
    Mix.a = a;
    Mix.b = a + 1;
    Mix.c = a - 1;
  }
  if (Mix.x == 2) {
    Mix.a = a + 1;
    Mix.b = a;
    Mix.c = a - 1;
  }
  if (Mix.x == 3) {
    Mix.a = a - 1;
    Mix.b = a + 1;
    Mix.c = a;
  }
  return Mix;
}

void handlerGamePlaye(int x, int y, minMax mM) {
  mM.a = random(x, y);
  mM.b = random(x, y);
}

class minMax {
  int a;
  int b;
  minMax(this.a, this.b);
}

class mix {
  int a;
  int b;
  int c;
  int x;
  mix(this.a, this.b, this.c, this.x);
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}












// class _HomePageState extends State<gamePlayScreen> {
//   bool valuefirst = false;
//   bool valuesecond = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Checkbox Example'),
//         ),
//         body: Container(
//             child: Column(
//           children: <Widget>[
//             apparColumn(color, Icons.add, '1', '450'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'PROGRESS',
//                   style: TextStyle(fontSize: 17.0),
//                 ),

//                 Transform.scale(
//                   scale: 0.5,
//                   child: Checkbox(
//                     checkColor: Colors.greenAccent,
//                     activeColor: Colors.red,
//                     value: this.valuefirst,
//                     // autofocus: true,
//                     // focusColor: Colors.black,
//                     // fillColor: Colors.black,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         this.valuefirst = value!;
//                       });
//                     },
//                     // onChanged: null,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

// class _HomePageState2 extends State<gamePlayScreen> {
//   bool valuefirst = false;
//   bool valuesecond = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Checkbox Example'),
//         ),
//         body: Padding(
//             padding: EdgeInsets.all(7),
//             child: Column(
//               children: <Widget>[
//                 apparColumn(color, Icons.add, '1', '450'),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'PROGRESS',
//                       style: TextStyle(fontSize: 17.0),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                     child: GridView.count(
//                   crossAxisCount: 12,
//                   children: stations.map((item) {
//                     return StateCheckBox(item: item);
//                   }).toList(),
//                 )),
//               ],
//             )),
//       ),
//     );
//   }
// }

// class levelScreen extends StatelessWidget {
//   const levelScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;

//     return MaterialApp(
//       // title: 'Flutter layout Demo',
//       theme: ThemeData(
//           //   primarySwatch: Colors.blue,
//           ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           backgroundColor: Colors.white10,
//           appBar: AppBar(
//             title: const Text('Flutter layout demo'),
//           ),
//           body: Padding(
//               padding: EdgeInsets.all(7),
//               child: Column(children: [
//                 Image.asset(
//                   'images/bkgMenu.png',
//                   width: 500,
//                   height: 240,
//                   //fit: BoxFit.cover, // can chinh theo kich thuoc
//                 ),
//                 Expanded(
//                     child: ListView.builder(
//                         padding: const EdgeInsets.all(8),
//                         itemCount: 12,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             height: 50,
//                             color: Colors.amber[colorCodes[index]],
//                             child:
//                                 Center(child: Text('Entry ${entries[index]}')),
//                           );
//                         })),
//                 // _backButtonColumn(
//                 //     color, Icons.exit_to_app, 'exit', 50, context),
//               ]))),
//     );
//   }
// }



// class gamePlayScreen extends StatelessWidget {
//   const gamePlayScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;

//     return MaterialApp(
//       // title: 'Flutter layout Demo',
//       theme: ThemeData(
//           //   primarySwatch: Colors.blue,
//           ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           backgroundColor: Colors.white10,
//           appBar: AppBar(
//             title: const Text('Game Play Screen'),
//           ),
//           body: ListView(
//             children: [
//               apparColumn(color, Icons.add, '1', '450'),
//               SizedBox(
//                 height: 40,
//               ),
//               // _HomePageState createState() => _HomePageState();
//             ],
//           )),
//     );
//   }
// }




// Padding answer(
//   int A,
//   int B,
//   int C,
//   int x,
//   int _incrementScore(),
// ) {
//   int a = 0, b = 0, c = 0;
//   if (x == 1) {
//     a = 1;
//   }
//   if (x == 2) {
//     b = 1;
//   }
//   if (x == 3) {
//     c = 1;
//   }
//   return Padding(
//       padding: EdgeInsets.fromLTRB(80, 100, 80, 120),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           answerButtonColumn(color, A.toString(), 30, a, _incrementScore()),
//           answerButtonColumn(color, B.toString(), 30, b, _incrementScore()),
//           answerButtonColumn(color, C.toString(), 30, c, _incrementScore()),
//         ],
//       ));
// }