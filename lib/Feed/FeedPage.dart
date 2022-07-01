import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit/Feed/PostTileFeed.dart';
import 'package:reddit/Feed/add_post.dart';
import 'package:reddit/ProfilePage.dart';
import '../Classes/Post.dart';
import '../Classes/User.dart';
import '../CommunityFiles/CommunityScreen.dart';

class FeedPage extends StatefulWidget {
  List<User>? users;
  User user;
  Function addPost;
  Function addComment;
  Function addCommunity;

  FeedPage( {required this.users, required this.user,required this.addComment,required this.addPost,required this.addCommunity}) {
    print(user.username);
    print(user.password);
  }

  @override
  State<FeedPage> createState() =>
      _FeedPageState(users: users ?? [], user: user);
}

class _FeedPageState extends State<FeedPage> {
  User user;
  List<User> users;
  List<Post>? postsForHome;
  List<Post>? posts = [];
  List<Post>? postsForPopular = [];
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int currentPage = 0;
  bool onhome = true;

  _FeedPageState({required this.users, required this.user});

  @override
  void initState() {
    setState(() {
      for(User user in users) {
        posts?.addAll(user.Posts);
        print(user.Posts.length.toString()+user.Posts[0].comments.toString()+"from feed page init");
      }
      posts?.sort((a, b) => b.createdAt!.compareTo(a.createdAt??DateTime.now()));
      postsForHome?.addAll(posts??[]);
      print(posts![0].comments??"djhdujh"+"from feed page init");
      posts?.sort((a, b) => b.likes.length!.compareTo(a.likes.length??0));
      postsForPopular=posts;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    switch (_index) {
      case 0:
        break;
      case 1:
        _index = 0;
        break;
      case 2:
        _index = 0;
        break;
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: const Text('Profile'),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            onTap: (int index) {
              print(postsForPopular.toString());
              setState(() {
                if (pageController.hasClients)
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
              });
            },
            tabs: [
              Tab(
                icon: Icon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.fire,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          leading: const Icon(Icons.supervised_user_circle),
          title: Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          )),
          actions: [
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _index = index;
            });
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return AddPost(
                    key: Key("Add Post"),
                    user: user,
                    addPost: widget.addPost,
                  );
                }),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return CommunityScreen(
                    key: Key("Community Screen"),
                    user: user,
                  );
                }),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return ProfilePage(
                    key: Key("Profile Page"),
                    user: user,
                  );
                }),
              );
            }
          },
          currentIndex: _index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.redditAlien,
                color: Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Colors.grey,
              ),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: Colors.grey,
              ),
              label: 'Communities',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: PageView(
          key: const PageStorageKey<String>('FeedPage'),
          controller: pageController,
          children: [
            PosttileFeed(posts: posts ?? [], user: user,addComment: widget.addComment,),
            PosttileFeed(posts: postsForPopular ?? [], user: user,addComment: widget.addComment,),
          ],
        ),
      ),
    );
  }
}
