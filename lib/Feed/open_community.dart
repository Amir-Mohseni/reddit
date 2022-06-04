import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Feed/PostTileCommunity.dart';
import '../Classes/Community.dart';
import '../Classes/Post.dart';
import '../Classes/User.dart';
import '../assets/colors/ColorSleect.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../eg. Colors.dar.dart';

class OpenCommunity extends StatefulWidget {
  OpenCommunity(
      {required Key key, required this.user, required this.community})
      : super(key: key);

  User user;
  Community community;

  @override
  State<OpenCommunity> createState() => _OpenCommunityState(user: user, community: community);
}

class _OpenCommunityState extends State<OpenCommunity> {
  User user;
  Community community;
  PageController pageController =
  PageController(initialPage: 0, viewportFraction: 1);
  int currentPage = 0;
  bool onhome = true;
  _OpenCommunityState({required this.user, required this.community});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Communities'),
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
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            'assets/images/iconBlue.jpg',
                            width: 100,
                            height: 100,
                            //  fit:BoxFit.fill
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(50),
                          child: ListTile(
                            title: Text(widget.community.name,
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            subtitle: Text("\n\n" + widget.community.description + "\n\n\n",
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.edit),
                          ),
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                iconAndSub(user!.Posts!.length.toString(),
                                    FontAwesomeIcons.comments),
                                iconAndSub(user!.Posts!.length.toString(),
                                    FontAwesomeIcons.comments),
                                iconAndSub(user!.Posts!.length.toString(),
                                    FontAwesomeIcons.comments),
                                //  iconAndSub(user!.communities!.length.toString(),FontAwesomeIcons.users),
                              ],
                            )),
                      ],
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                    itemCount: user?.Posts?.length ?? 0,
                    itemBuilder: (context, index) {
                      print(user?.Posts?.length.toString());
                      int i = index;
                      return Column(
                        children: [
                          postTile(user!.Posts![index]),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: user?.Posts![i]?.comments?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: ListTile(
                                      title: Text(user?.name ?? 'nulllll',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                        user?.Posts![i].comments!
                                            .elementAt(index) ??
                                            'nulllllllll',
                                        style: TextStyle(color: orangeblack),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
  Widget iconAndSub(String sub, dynamic icon) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      children: [
        Icon(icon, size: 60, color: orangepurple),
        Text(sub),
      ],
    ),
  );

  Widget drawer() => Drawer(
    backgroundColor: blackorange,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          curve: Curves.easeIn,
          child: Text(
            'Profile',
            style: TextStyle(color: orangepurple),
          ),
          decoration: BoxDecoration(
            color: purpleorange,
          ),
        ),
        ListTile(
          title: Text('Home', style: TextStyle(color: orangepurple)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Profile', style: TextStyle(color: orangepurple)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Logout', style: TextStyle(color: orangepurple)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );

  Widget postTile(Post post) {
    return Container(
      height: 470,
      color: Colors.black,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/iconPurple.jpg',
            height: 400,
            width: 400,
          ),
          Positioned(
              top: 440,
              left: 10,
              child: Text(post?.content ?? "nuulll",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ))),
          Positioned(
              top: 410,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Icon(
                      FontAwesomeIcons.comment,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Icon(
                      FontAwesomeIcons.flushed,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}