import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Classes/Post.dart';
import '../Classes/User.dart';
import '../eg. Colors.dar.dart';


class PosttileFeed extends StatefulWidget {
  List<Post> posts;
  PosttileFeed({Key? key,required this.posts}) : super(key: key);

  @override
  State<PosttileFeed> createState() => _PosttileFeedState(posts);
}

class _PosttileFeedState extends State<PosttileFeed> {
  List<Post> posts;
  _PosttileFeedState(this.posts);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          int i=index;
          return Column(
            children: [
              postTile( posts[index]),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: posts?[i]?.comments?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey[200],
                        child: ListTile(
                          title: Text(posts[i].user?.username?? 'nulllll',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            posts?[i].comments!
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
      ),
    );
  }
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
              child: Text(post?.content,
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
