import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SingUp/SingUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController namec = TextEditingController();
  TextEditingController pasc = TextEditingController();
  DateTime daytime = DateTime.now();
  String userError = "", desError = "";
  bool _isLoading = false;

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
              height: MediaQuery.of(context).size.height * 0.4,
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
                    key: Key('loginButton'),
                    // margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 8.0),
                    child: MaterialButton(
                      // padding: const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      color: Colors.blueAccent,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          if (namec.text.length < 3) {
                            userError = "username must be > 4";
                          } else if (pasc.text.length < 4) {
                            userError = "";
                            desError = "password must be > 4";
                          } else {
                            userError = "";
                            desError = "";
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
