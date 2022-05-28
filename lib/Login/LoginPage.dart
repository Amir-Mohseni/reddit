import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Classes/AllUsers.dart';
import 'package:reddit/eg.%20Colors.dar.dart';
import 'package:reddit/main.dart';

import '../Classes/User.dart';
import '../SingUp/SingUp.dart';

class LoginPage extends StatefulWidget {
  Function containsUser;

  LoginPage({Key? key, required this.containsUser}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState(containsUser);
}

class _LoginPageState extends State<LoginPage> {
  Function containsUser;
  TextEditingController namec = TextEditingController();
  TextEditingController pasc = TextEditingController();
  DateTime daytime = DateTime.now();
  String userError = "", desError = "";
  bool _isLoading = false;
  RegExp regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$");

  _LoginPageState(this.containsUser);

  @override
  void dispose() {
    namec.dispose();
    pasc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    color: Colors.white,
                    child: TextField(
                      controller: namec,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
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
                      controller: pasc,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
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
                       color : Color.fromRGBO(93, 177, 142, 1.0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          if (namec.text.length<8)
                          {
                           // print(namec.text);
                           // print(regExp.hasMatch(pasc.text));
                            userError = "username must be at least 8 characters long";
                            desError="";
                          } else if (!regExp.hasMatch(pasc.text) ) {
                            userError = "";
                            desError = "password must be at least 8 characters long containing one uppercase letter one lowercase letter and one number";
                          } else {
                            userError = "";
                            desError = "";
                          widget.containsUser(User(
                                username: namec.text,
                                password: pasc.text,));
                            Future.delayed(Duration(milliseconds: 500), () {
                              Navigator.pop(context);
                            });
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
    );
  }
}
