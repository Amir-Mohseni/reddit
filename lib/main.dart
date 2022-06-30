import 'package:flutter/material.dart';
import 'package:reddit/splash.dart';
import 'Classes/Community.dart';
import 'Classes/Post.dart';
import 'Classes/User.dart';
import 'Feed/FeedPage.dart';
import 'SignUp/SingUp.dart';

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
        primaryColor: Colors.white,
        primaryColorDark: Colors.black,
        accentColor: Colors.black,
      ),
      home: const Splash(),
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
  List<User>? users;
  late User mainUser;
  List<Post> posts = [];

  @override
  initState() {
    super.initState();
    posts =[
      Post(
        id: '1',
        title: 'This is a title',
        image: "https://i.redd.it/qn7f921xlqz21.jpg",
        content: 'This is a content',
      ),
      Post(
        id: '2',
        title: 'This is a title',
        image: "D:\reddit1\assets\images\icon1.jpg",
        content: 'This is a content',
      ),
      Post(
        id: '3',
        title: 'This is a title',
        image: "D:\reddit1\assets\images\icon1.jpg",
        content: 'This is a content',
      ),
      Post(
        id: '4',
        title: 'This is a title',
        image: 'D:\reddit1\assets\images\icon1.jpg',
        content: 'This is a content',
      ),
    ];
    users = [
      User(
        username: 'useruser1',
        password: 'passPASS1',
        Posts: posts,
      ),
      User(
        username: 'user2',
        password: 'pass2',
        Posts: posts,
      ),
    ];
    Community selectedCommunity = new Community(
      name: "Test",
      description: "Test",
      admins: [users![0]],
    );
    users![0].communities.add(selectedCommunity);
    users![0].Posts = posts.cast<Post>();
    users![1].Posts = posts.cast<Post>();
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
              child: Text('Sign Up'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpPage()),
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                mainUser = users![0];
                // need to change later
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedPage(mainUser)),
                );
              },
              child: Text('Feed'),
            )
          ],
        ),
      ),
    );
  }
}