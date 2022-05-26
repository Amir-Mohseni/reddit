import 'package:flutter/material.dart';
import 'package:reddit/Login/LoginPage.dart';
import 'package:reddit/SingUp/SingUp.dart';
import 'Feed/FeedPage.dart';
import 'Classes/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit AP Project',
      theme: ThemeData(
        primaryColorDark: Colors.black,
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Reddit '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? users = [];
  User? mainUser;


  @override
  initState() {
    super.initState();
    users = [
      User(
        username: 'useruser1',
        password: 'passPASS1',
      ),
      User(
        username: 'user2',
        password: 'pass2',
      ),
    ];
  }

  // users.add( User(username : "user",password: "user"));
  void addUser(User user) {
    setState(() {
      users?.add(user);
      print("fromadduser");
      for (var i = 0; i < users!.length; i++) {
        print(users?.elementAt(i)?.username);
      }
    });
  }
  void containsUser(User user){
    setState((){
      for(User u in users!) {
        if(u.username == user.username && u.password == user.password){
          print("zxfhjzih");
          mainUser = user;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Text(widget.title, style: TextStyle(color: Colors.white))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(containsUser: containsUser)),
                );
              },
            ),
            RaisedButton(
              child: Text('Feed(Beta)'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHome()),
                );
              },
            ),
            RaisedButton(
                child: Text('Sign up'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage(addUser: addUser,)),
                  );
                })
          ],
        ),
      ),
    );
  }
}
