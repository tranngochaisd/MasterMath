import "package:flutter/material.dart";
import 'package:math_lord/seletcGameScreen.dart';

var h;
var w;

class menuScreen extends StatelessWidget {
  const menuScreen({super.key});
  @override
  Widget build(BuildContext context) {
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

              buttonSection2(context),

              // titleSection,
              // buttonSection,
              // textSection,
            ],
          )),
    );
  }
}
// Widget build(BuildContext context) {
// }

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => gameSelection()));
          },
        ),
      ),
    ],
  );
}

// Column _buildButtonColumn(
//     Color color, IconData icon, String label, double _size) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Ink(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.indigoAccent, width: 4.0),
//           color: Colors.indigo[900],
//           // shape: BoxShape.s,
//         ),
//         child: InkWell(
//           //padding:EdgeInsets.all(20.0),
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Column(children: [
//               Icon(
//                 icon,
//                 size: _size,
//                 color: color,
//               ),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: color,
//                 ),
//               ),
//             ]),
//           ),
//           borderRadius: BorderRadius.circular(
//               1000.0), //Something large to ensure a circle
//           onTap: () {
//             //print('Hai Hai Hai Hung Hung Hung');
//             // Navigator.push(context, route);
//             // Navigator.push(context,
//             //     MaterialPageRoute(builder: (context) => gameSelection()));
//           },
//         ),
//       ),
//       // Icon(icon, color: color),
//       // Container(
//       //   margin: const EdgeInsets.only(top: 8),
//       //   child: Text(
//       //     label,
//       //     style: TextStyle(
//       //       fontSize: 12,
//       //       fontWeight: FontWeight.w400,
//       //       color: color,
//       //     ),
//       //   ),
//       // ),
//     ],
//   );
// }

Color color = Colors.white;

// Widget buttonSection = Row(
//   mainAxisAlignment: MainAxisAlignment.spacehEvenly,
//   // khoan cach o giua
//   children: [
//     _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//     _buildButtonColumn(color, Icons.share, 'SHARE'),
//   ],
// );

// class test(BuildContext context){

// }

Widget buttonSection2(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtonColumn(color, Icons.notifications, 'notify', 50, context),
          spaceh,
          _buildButtonColumn(color, Icons.settings, 'settings', 50, context),
          spaceh,
          _buildButtonColumn(color, Icons.apps, 'more app', 50, context),
        ],
      ),
      spacew,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildButtonColumn(color, Icons.play_arrow, '', 170, context),
          spaceh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildButtonColumn(
                  color, Icons.language, 'translate', 50, context),
              SizedBox(
                width: 20,
              ),
              _buildButtonColumn(color, Icons.exit_to_app, 'exit', 50, context),
            ],
          )
        ],
      )
    ],
  );
}

Widget spaceh = SizedBox(
  height: 10,
);
Widget spacew = SizedBox(
  width: 10,
);

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
