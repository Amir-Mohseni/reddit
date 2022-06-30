import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Login/LoginPage.dart';
import 'package:reddit/eg.%20Colors.dar.dart';

import '../Classes/User.dart';
import '../Feed/FeedPage.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = false;
  TextEditingController namec = TextEditingController();
  TextEditingController pasc = TextEditingController();
  TextEditingController cpasc = TextEditingController();
  DateTime daytime = DateTime.now();
  String userError = "", desError = "", cpassError = "";
  RegExp regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$");
  bool _isLoading = false;

  _SignUpPageState();

  @override
  void dispose() {
    namec.dispose();
    pasc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInDown(
        duration: Duration(milliseconds: 1500),
        child: Container(
          alignment: Alignment.center,
          color: purpleorange,
          child: Card(
            shadowColor: Colors.grey,
            key: Key('loginCard'),
            elevation: 10,
            borderOnForeground: true,
            color: orangepurple,
            margin: EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Container(
                    key: Key('username'),
                    padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 5.0),
                    child: TextField(
                      controller: namec,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person, color: Colors.blue,),
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
                      controller: pasc,
                      textAlign: TextAlign.left,
                      obscureText: passwordVisible,
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
                    key: Key('confirmpassword'),
                    padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                    child: TextField(
                      obscureText: true,
                      controller: cpasc,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          hintText: "Confirm Password",
                          errorText: cpassError,
                          contentPadding:
                              const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                  ),
                  Container(
                    key: Key('loginButton'),
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      color: Colors.blueAccent,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() async {
                          if (namec.text.length < 8) {
                            userError =
                                "username must be at least 8 characters long";
                            desError = "";
                          } else if (!regExp.hasMatch(pasc.text)) {
                            userError = "";
                            desError =
                                "password must be at least 8 characters long containing one uppercase letter one lowercase letter and one number";
                          } else if (pasc.text != cpasc.text) {
                            userError = "";
                            desError = "";
                            cpassError = "password does not match";
                          } else {
                            userError = "not connected to server";
                            desError = "";
                            cpassError = "";
                            User user = User(
                                name: namec.text,
                                password: pasc.text,
                            );
                            setState(() {
                              SignUp(namec.text, pasc.text);
                            });
                            if(userError == "") {
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
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    color: Colors.blueAccent,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginPage()));
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
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

  void SignUp(String username, String password) async {
    String request = "sign up\nusername:$username,,password:$password\u0000";
    await Socket.connect('192.168.0.235', 8080).then((serverSocket) {
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((data) {
        String result = String.fromCharCodes(data).trim();
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

