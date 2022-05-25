import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Classes/Post.dart';
import 'Classes/User.dart';

class ProfilePage extends StatefulWidget {
  User user;
  ProfilePage({Key? key,required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState(user:user);
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  _ProfilePageState({required this.user});
  @override
  Widget build(BuildContext context) {
    String? titl;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Profile'),
              decoration: BoxDecoration(
                color: Colors.,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )  ,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 110,
              child: Card(
                shadowColor: Colors.white,
                elevation: 10,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                           'assets/images/iconBlue.jpg',
                            width: 100,
                            height: 100,
                          //  fit:BoxFit.fill
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: ListTile(
                              title: Text(user?.username??'defult'),
                              subtitle: Text(user?.bio??'defult'),
                            )
                          ),
                      ),
                    ],
                  ),
                )
              ),

            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: user?.Posts?.length??0,
                  itemBuilder: (context, index) {
                  return postTile(user!.Posts![index]);
                },
              )

              ),
            ),
          ],

    ),
    ),
    );
  }

Widget postTile(Post post){
  return ListTile(
    title: Text(post.content),
    subtitle: Text(post.content),
  );
}

}
