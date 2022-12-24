
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'GameSelectionScreen.dart';
import 'PlayGameScreen.dart';
import 'data.dart';
import 'playMusicScreen.dart';

final List<String> entries = <String>['A', 'B', 'C', 'D'];
final List<int> colorCodes = <int>[600, 500, 100];
var h;
var w;
Color color = Colors.white;
int indexLevel = 0;

// class CSDL extends StatelessWidget{
//   CSDL({Key?key}):super(key: key);

//   List<station> station = [
//     station(11,'7000','1',Icons.star, )
//   ]
//   return null;
// }



class levelScreen extends StatelessWidget {
  levelScreen({super.key});

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
          backgroundColor: ThemeColor,

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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
            // padding: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(1.0),

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
    Color color1 = Colors.white38;
    Color color2 = Colors.white38;
    Color color3 = Colors.white38;
    Color colorM = Colors.white38;
  if(item.isOpen == true){
    colorM = Colors.white;
    if (item.score >= 7000) {
      color1 = Colors.white;
      color2 = Colors.white;
      color3 = Colors.white;
    }
    if (6000 < item.score && item.score < 7000) {
      color1 = Colors.white;
      color2 = Colors.white;
    }
    if (5000 < item.score && item.score < 6000) {
      color1 = Colors.white;
    }

    print('score bang bao nhieu ' + item.score.toString() );

  }
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: InkWell(
          onTap: () {
            print('Clicked ${item.label}');
            if(item.isOpen == true) {
              indexLevel =  item.id;
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => gamePlayScreen()));
            }else{
              print('Chưa mở khóa màng thứ ${item.label}');
            }
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
                      color: colorM,
                    ),
                  ),
                  Text(
                    item.score.toString(),

                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: colorM,
                    ),
                  ),
                  Row(
                    //  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: item.sizeIcon,
                        color: color1,
                      ),
                      Icon(
                        item.icon,
                        size: item.sizeIcon,
                        color: color2,
                      ),
                      Icon(
                        item.icon,
                        size: item.sizeIcon,
                        color: color3,
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
