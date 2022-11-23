import "package:flutter/material.dart";
import 'leverScreen.dart';

var h;
var w;

class gameSelection extends StatelessWidget {
  const gameSelection({super.key});

  @override
  Widget build(BuildContext context) {
    Column _buildButtonColumn(Color color, IconData icon, String label,
        double _size, BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigoAccent, width: 4.0),
              color: Color.fromARGB(255, 0, 56, 131),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => levelScreen()));
              },
            ),
          ),
        ],
      );
    }

    Widget buttonSetcGame = Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButtonColumn(color, Icons.add, 'addittion', 50, context),
              spacew,
              _buildButtonColumn(color, Icons.remove, 'subtract', 50, context),
              spacew,
              _buildButtonColumn(
                  color, Icons.voicemail_rounded, 'add&sub', 50, context),
            ],
          ),
          spaceh,
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButtonColumn(color, Icons.close, 'multipt', 50, context),
              spacew,
              _buildButtonColumn(
                  color, Icons.subscript, 'division', 50, context),
              spacew,
              _buildButtonColumn(
                  color, Icons.subscript, 'division', 50, context),
            ],
          ),
          spaceh,
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButtonColumn(
                  color, Icons.highlight_off, 'Yes&No', 50, context),
              spacew,
              _buildButtonColumn(color, Icons.school, 'rank', 50, context),
              spacew,
              _buildButtonColumn(color, Icons.arrow_back, 'back', 50, context),
            ],
          ),
        ]);

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return MaterialApp(
      // title: 'Flutter layout Demo',
      theme: ThemeData(
          //   primarySwatch: Colors.blue,
          ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            title: const Text('Flutter layout demo'),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/bkgMenu.png',
                width: 500,
                height: 240,
                //fit: BoxFit.cover, // can chinh theo kich thuoc
              ),
              SizedBox(
                height: 40,
              ),
              buttonSetcGame,
              // titleSection,
              // buttonSection,
              // textSection,
            ],
          )),
    );
  }
}

Widget spaceh = SizedBox(
  height: 10,
);
Widget spacew = SizedBox(
  width: 10,
);
