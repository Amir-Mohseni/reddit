import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classes/User.dart';

class SignUpPage extends StatefulWidget {
  Function addUser;

  SignUpPage({Key? key, required this.addUser}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState(addUser);
}

class _SignUpPageState extends State<SignUpPage> {
  Function addUser;
  TextEditingController namec = TextEditingController();
  TextEditingController pasc = TextEditingController();
  TextEditingController cpasc = TextEditingController();
  DateTime daytime = DateTime.now();
  String userError = "", desError = "", cpassError = "";
  RegExp regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$");
  bool _isLoading = false;

  _SignUpPageState(this.addUser);

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
        color: Color.fromRGBO(93, 177, 142, 1.0),
        child: Card(
          shadowColor: Colors.grey,
          key: Key('loginCard'),
          elevation: 10,
          borderOnForeground: true,
          color: Colors.white,
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
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
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
                  key: Key('confirmpassword'),
                  padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                  child: TextField(
                    controller: cpasc,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
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
                      setState(() {
                        if (namec.text.length < 8) {
                          // print(namec.text);
                          // print(regExp.hasMatch(pasc.text));
                          userError =
                              "username must be at list 8 characters long";
                          desError = "";
                        } else if (!regExp.hasMatch(pasc.text)) {
                          userError = "";
                          desError =
                              "password must be at list 8 characters long containing one uppercase letter one lowercase letter and one number";
                        } else if (pasc.text != cpasc.text) {
                          userError = "";
                          desError = "";
                          cpassError = "password does not match";
                        } else {
                          addUser(
                              User(username: namec.text, password: pasc.text));
                          Future.delayed(Duration(milliseconds: 500), () {
                            Navigator.pop(context);
                          });
                        }
                      });
                    },
                    child: const Text(
                      "Sign In",
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
