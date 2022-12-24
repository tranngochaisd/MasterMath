import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'MenuScreen.dart';
import 'rigisterScreen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

Color colorBlue1 = Colors.indigo.shade900;
var colorBlue2 = Colors.indigoAccent;
var maincolor = Colors.indigo.shade900;
var maincolour = [Colors.indigoAccent, Colors.indigo.shade900];

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State {
  String valueU = "";
  String valueP = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(String email, password) async {
    try {
      Response response = await post(Uri.parse('eve.holt@reqres.in'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => menuScreen()));
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: h,
          width: w,
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //   image: NetworkImage(
          //       "https://images.pexels.com/photos/301920/pexels-photo-301920.jpeg?cs=srgb&dl=pexels-pixabay-301920.jpg&fm=jpg"),
          //   alignment: Alignment.topCenter,
          // )),

          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/bkgMenu.jpg'),
          //    // fit: BoxFit.cover,
          //   ),
          // ),
          child: Column(
            children: [
              SizedBox(
                height: h / 24,
              ),
              const Text(
                'Đăng Nhập',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              // SizedBox(
              //   height: h / 20,
              // ),
              // Image.asset(
              //   'images/bkgMenu.png',
              //   width: 420,
              //   height: 240,
              //   //fit: BoxFit.cover, // can chinh theo kich thuoc
              // ),
              SizedBox(
                height: h / 24,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, right: 15, left: 15, bottom: 10),
                  width: w,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h / 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          onChanged: (value) {
                            valueU = value;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                      // SizedBox(
                      //   height: h / 50,
                      // ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          onChanged: (value) {
                            valueP = value;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.password),
                          ),
                          obscureText: true,
                        ),
                      ),
                      // const Divider(
                      //   thickness: 1,
                      // ),
                      SizedBox(
                        height: h / 50,
                      ),
                      Row(
                        children: [
                          Container(
                            height: h / 45,
                            width: w / 23,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: maincolor, width: w / 200),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Text(
                            " Remember me",
                            style: TextStyle(
                                color: const Color(0xFF9e9b9b),
                                fontSize: h / 60),
                          ),
                          const Expanded(child: Text("")),
                          // Text(
                          //   "Forget Password?",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w600,
                          //       color: maincolor,
                          //       fontSize: h / 60),
                          //
                          // ),

                          Container(
                            margin: EdgeInsets.all(20),
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                            child: OutlinedButton(
                              child: Text(
                                "Forget Password",
                                style: TextStyle(
                                  fontSize: h / 60,
                                  color: Colors.indigo[900],
                                ),
                              ),
                              onPressed: () {

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Rigister()));
                                }

                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: Text("")),
                      InkWell(
                        onTap: () {
                          //  login(emailController.text.toString(), passwordController.text.toString());
                          print('đã vào login');
                          if(emailController.text.toString()=='hung@gmail.com'&& passwordController.text.toString() == 'hung11' ){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => menuScreen()));
                          }
                          if(emailController.text.toString()=='hai@gmail.com'&& passwordController.text.toString() == 'hai11' ){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => menuScreen()));
                          }
                        },
                        child: Container(
                          height: h / 14,
                          width: w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: maincolour),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: h / 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
