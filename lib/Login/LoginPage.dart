import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Classes/AllUsers.dart';
import 'package:reddit/eg.%20Colors.dar.dart';
import '../Classes/User.dart';
import '../Feed/FeedPage.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  TextEditingController namec = TextEditingController();
  TextEditingController pasc = TextEditingController();
  DateTime daytime = DateTime.now();
  String userError = "", desError = "";
  bool _isLoading = false;
  RegExp regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$");

  _LoginPageState();

  @override
  void dispose() {
    namec.dispose();
    pasc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        duration: Duration(milliseconds: 1500),
        child: Container(
          alignment: Alignment.center,
          color: blackorange,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(150.0),
            ),
            shadowColor: Colors.grey,
            key: Key('loginCard'),
            elevation: 100,
            borderOnForeground: false,
            color: orangeblack,
            margin: EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Container(
                    key: Key('username'),
                    padding: EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 5.0),
                    // color: Colors.white,
                    child: TextField(
                      controller: namec,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          alignLabelWithHint: true,
                          hoverColor: Colors.white,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          errorText: userError,
                          hintText: "Username",
                          contentPadding:
                              const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                  ),
                  Container(
                    key: Key('password'),
                    padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                    //    margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 8.0),
                    child: TextField(
                      obscureText: passwordVisible,
                      controller: pasc,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hintText: "Password",
                          errorText: desError,
                          contentPadding:
                              const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                  ),
                  Container(
                    key: Key('loginButton'),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: MaterialButton(
                      color: Color.fromRGBO(93, 177, 142, 1.0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          if (namec.text.length < 8) {
                            userError =
                                "username must be at least 8 characters long";
                            desError = "";
                          } else if (!regExp.hasMatch(pasc.text)) {
                            userError = "";
                            desError =
                                "password must be at least 8 characters long\n containing one uppercase letter one lowercase letter and one number\n";
                          } else {
                            userError = "Not connected to server";
                            desError = "";
                            setState((){
                              Login(namec.text, pasc.text);
                            });
                            if(userError == "") {
                              User user = new User(username: namec.text, password: pasc.text);
                              Future.delayed(Duration(milliseconds: 500), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FeedPage(user)));
                              });
                            }
                          }
                        });
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Login(String username, String password) async {
    String request = "sign in\nusername:$username,,password:$password\u0000";
    await Socket.connect('192.168.0.235', 8080).then((serverSocket) {
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((data) {
        String result = String.fromCharCodes(data).trim();
        String expected = "signIn:$username:success";
        print(result);
        if (result.contains("success")) {
          setState(() {
            userError = "";
          });
        } else {
          setState(() {
            userError = "username or password is incorrect";
          });
        }
      });
    });
  }
}
