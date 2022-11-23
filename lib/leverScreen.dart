// import "package:flutter/material.dart";
// import 'package:math_lord/seletcGameScreen.dart';

// import 'test/tesrListView.dart';

// var h;
// var w;
// Color color = Colors.white;

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
//                         itemCount: entries.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             height: 50,
//                             color: Colors.amber[colorCodes[index]],
//                             child:
//                                 Center(child: Text('Entry ${entries[index]}')),
//                           );
//                         })
//                         ),
//                 _backButtonColumn(
//                     color, Icons.exit_to_app, 'exit', 50, context),
//               ]))),
//     );
//   }
// }

// Column _backButtonColumn(Color color, IconData icon, String label, double _size,
//     BuildContext context) {
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
//             print('Hai Hai Hai Hung Hung Hung');
//             // Navigator.push(context, route);
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => gameSelection()));
//           },
//         ),
//       ),
//     ],
//   );
// }

// Column _buildButtonColumn(Color color, IconData icon, String label,
//     double _size, BuildContext context) {
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
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w400,
//                   color: color,
//                 ),
//               ),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400,
//                   color: color,
//                 ),
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     icon,
//                     size: _size,
//                     color: color,
//                   ),
//                   Icon(
//                     icon,
//                     size: _size,
//                     color: color,
//                   ),
//                   Icon(
//                     icon,
//                     size: _size,
//                     color: color,
//                   ),
//                 ],
//               ),
//             ]),
//           ),
//           borderRadius: BorderRadius.circular(
//               1000.0), //Something large to ensure a circle
//           onTap: () {
//             print('Hai Hai Hai Hung Hung Hung');
//             // Navigator.push(context, route);
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => gameSelection()));
//           },
//         ),
//       ),
//     ],
//   );
// }

// // Widget listLevel(BuildContext context) {
// //   return ListView.builder(
// //       padding: const EdgeInsets.all(8),
// //       itemCount: entries.length,
// //       itemBuilder: (BuildContext context, int index) {
// //         return Container(
// //             // height: 50,
// //             // color: Colors.amber[colorCodes[index]],
// //             // child: Center(child: Text('Entry ${entries[index]}')),
// //             );
// //       });
// // }

// // Widget Listview2 = ListView.builder(
// //     padding: const EdgeInsets.all(8),
// //     itemCount: entries.length,
// //     itemBuilder: (BuildContext context, int index) {
// //       return Container(
// //           // height: 50,
// //           // color: Colors.amber[colorCodes[index]],
// //           // child: Center(child: Text('Entry ${entries[index]}')),
// //           );
// //     });

import "package:flutter/material.dart";
import 'package:math_lord/playGameScreen.dart';
import 'package:math_lord/seletcGameScreen.dart';

import 'test/tesrListView.dart';

final List<String> entries = <String>['A', 'B', 'C', 'D'];
final List<int> colorCodes = <int>[600, 500, 100];
var h;
var w;
Color color = Colors.white;

// class CSDL extends StatelessWidget{
//   CSDL({Key?key}):super(key: key);

//   List<station> station = [
//     station(11,'7000','1',Icons.star, )
//   ]
//   return null;
// }

class Station {
  int id;
  String score;
  String label;
  IconData icon;
  double sizeIcon;
  //BuildContext context;

  Station(this.id, this.score, this.label, this.icon, this.sizeIcon);
}

class levelScreen extends StatelessWidget {
  levelScreen({super.key});
  List<Station> stations = [
    Station(1, '7000', '1', Icons.star, 10),
    Station(2, '7000', '2', Icons.star, 10),
    Station(3, '7000', '3', Icons.star, 10),
    Station(4, '7000', '4', Icons.star, 10),
    Station(5, '7000', '5', Icons.star, 10),
    Station(6, '7000', '6', Icons.star, 10),
    Station(7, '7000', '7', Icons.star, 10),
    Station(8, '7000', '8', Icons.star, 10),
    Station(9, '7000', '9', Icons.star, 10),
    Station(10, '7000', '10', Icons.star, 10),
    Station(11, '7000', '11', Icons.star, 10),
    Station(12, '7000', '12', Icons.star, 10),
    Station(13, '7000', '13', Icons.star, 10),
    Station(14, '7000', '14', Icons.star, 10),
    Station(15, '7000', '15', Icons.star, 10),
    Station(15, '7000', '16', Icons.star, 10),
  ];

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
          body: Padding(
              padding: EdgeInsets.all(7),
              child: Column(children: [
                Image.asset(
                  'images/bkgMenu.png',
                  width: 500,
                  height: 240,
                  //fit: BoxFit.cover, // can chinh theo kich thuoc
                ),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: 1.5,
                    crossAxisCount: 4,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    children: stations.map((item) {
                      return StationItem(item: item);
                    }).toList(),
                  ),
                ),
                _backButtonColumn(
                    color, Icons.exit_to_app, 'exit', 50, context),
              ]))),
    );
  }
}

Column _backButtonColumn(Color color, IconData icon, String label, double _size,
    BuildContext context) {
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

Column _buildButtonColumn(Color color, IconData icon, String label,
    String number, double _size, BuildContext context) {
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
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
              Text(
                number,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: _size,
                    color: color,
                  ),
                  Icon(
                    icon,
                    size: _size,
                    color: color,
                  ),
                  Icon(
                    icon,
                    size: _size,
                    color: color,
                  ),
                ],
              ),
            ]),
          ),
          borderRadius: BorderRadius.circular(
              1000.0), //Something large to ensure a circle
          onTap: () {
            print('Hai Hai Hai Hung Hung Hung');
            // Navigator.push(context, route);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => gamePlayScreen()));
          },
        ),
      ),
    ],
  );
}

class StationItem extends StatelessWidget {
  const StationItem({Key? key, required this.item}) : super(key: key);
  final Station item;
  @override
  Widget build(BuildContext context) {


    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: InkWell(
          onTap: () {
            print('Clicked ${item.label}');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => gamePlayScreen()));
          },
          splashColor: Colors.indigo[900],
          child: Card(
              child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigoAccent, width: 4.0),
              color: Colors.indigo[900],
              // shape: BoxShape.s,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
              Text(
                item.score,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
              Row(
                //  mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    size: item.sizeIcon,
                    color: color,
                  ),
                  Icon(
                    item.icon,
                    size: item.sizeIcon,
                    color: color,
                  ),
                  Icon(
                    item.icon,
                    size: item.sizeIcon,
                    color: color,
                  ),
                ],
              ),
            ]),
          )),
        ));
  }
}




// class StationItem extends StatelessWidget {
//   const StationItem({Key? key, required this.item}) : super(key: key);
//   final Station item;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//      // mainAxisSize: MainAxisSize.min,
//      // mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Ink(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.indigoAccent, width: 4.0),
//             color: Colors.indigo[900],
//             // shape: BoxShape.s,
//           ),
//           child: InkWell(
//             //padding:EdgeInsets.all(20.0),
//             child: Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Column(children: [
//                 Text(
//                   item.score,
//                   style: TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                     color: color,
//                   ),
//                 ),
//                 Text(
//                   item.label,
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w400,
//                     color: color,
//                   ),
//                 ),
//                 Row(
//                 //  mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       item.icon,
//                       size: item.sizeIcon,
//                       color: color,
//                     ),
//                     Icon(
//                       item.icon,
//                       size: item.sizeIcon,
//                       color: color,
//                     ),
//                     Icon(
//                       item.icon,
//                       size: item.sizeIcon,
//                       color: color,
//                     ),
//                   ],
//                 ),
//               ]),
//             ),
//             borderRadius: BorderRadius.circular(
//                 1000.0), //Something large to ensure a circle
//             onTap: () {
//               print('Hai Hai Hai Hung Hung Hung');
//               // Navigator.push(context, route);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => gameSelection()));
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
