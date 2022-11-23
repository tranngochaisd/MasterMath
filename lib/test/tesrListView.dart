import "package:flutter/material.dart";
import 'package:math_lord/seletcGameScreen.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
var h;
var w;
Color color = Colors.white;

// class listViewTest extends StatelessWidget {
//   const listViewTest({super.key});
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
//           body: ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: entries.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   height: 50,
//                   color: Colors.amber[colorCodes[index]],
//                   child: Center(child: Text('Entry ${entries[index]}')),
//                 );
//               })),
//     );
//   }
// }

class listViewTest extends StatelessWidget {
  const listViewTest({super.key});
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: Column(children: [
        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.indigoAccent, width: 4.0),
                      color: Colors.indigo[900],
                      // shape: BoxShape.s,
                    ),
                    child: InkWell(
                      //padding:EdgeInsets.all(20.0),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(children: [
                          Icon(
                            Icons.abc,
                            size: 10,
                            color: color,
                          ),
                          Text(
                            'Entry ${entries[index]}',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => gameSelection()));
                      },
                    ),
                  ),
                ],
              );
            })
      ]),
    );
  }
}
