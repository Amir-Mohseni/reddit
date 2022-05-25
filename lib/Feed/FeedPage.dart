import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
          appBar: new AppBar(
            leading: Icon(Icons.supervised_user_circle),
              title: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.black,),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              bottom: new TabBar(
                tabs: [
                  Tab(
                    child: Text('Home'),
                  ),
                  Tab(
                    child: Text('Popular'),
                  ),
                ],
              ),
          ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.redditAlien,
                color: Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, color: Colors.grey,),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books, color: Colors.grey,),
              label: 'Communities',
            ),
          ],
        ),
      ),
    );
  }
}