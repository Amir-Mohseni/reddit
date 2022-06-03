import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit/Feed/PostTileFeed.dart';

import '../Classes/Post.dart';
import '../Classes/User.dart';

class FeedPage extends StatefulWidget {
  List<User>? users;

  FeedPage({this.users});

  @override
  State<FeedPage> createState() => _FeedPageState(users: users ?? []);
}

class _FeedPageState extends State<FeedPage> {
  List<User>? users = [];
  List<Post>? postsForHome = [];
  List<Post>? posts = [];
  List<Post>? postsForPopular = [];
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int currentPage = 0;
  bool onhome = true;

  _FeedPageState({required this.users});

  @override
  void initState() {
    if (users?.length != 0) {
      for (dynamic user in users!) {
        for (dynamic i = 0; i < user?.Posts?.length; i++) {
          posts?.add(user?.Posts?.elementAt(i));
        }
      }
    }
    if (posts?.length != 0) {
      posts?.sort((a, b) =>
          (b.like?.users.length ?? 0.compareTo(a.like?.users.length ?? 0)));
      postsForPopular = posts?.sublist(0, posts?.length ?? 0);
      posts?.sort((a, b) => (b.createdAt.compareTo(a.createdAt)));
      postsForHome = posts?.sublist(0, posts?.length ?? 0);
      //postsForPopular = posts?.where((element) => !element.isHome)?.toList();
    }
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
                  FontAwesomeIcons.home,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.user,
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
                    border: InputBorder.none,
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
                Icons.library_books,
                color: Colors.grey,
              ),
              label: 'Communities',
            ),
          ],
        ),
        body: PageView(
            key: const PageStorageKey<String>('FeedPage'),
            controller: pageController,
            children: [
              PosttileFeed(posts: postsForHome ?? []),
              PosttileFeed(posts: postsForPopular ?? []),
            ],
          ),
        ),
    );
  }
}
