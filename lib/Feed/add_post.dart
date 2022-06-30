import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:item_selector/item_selector.dart';
import '../Classes/Community.dart';
import '../Classes/Post.dart';
import '../Classes/User.dart';


class AddPost extends StatefulWidget {
  User user;
  AddPost({required Key key, required this.user}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState(user: user);
}

class _AddPostState extends State<AddPost> {
  User? user;
  Community? community;
  late TextEditingController titleC;
  late TextEditingController descC;
  late DateTime dateC;

  _AddPostState({required this.user});

  @override
  void initState() {
    titleC = TextEditingController();
    descC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleC.dispose();
    descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Add a title"),
              controller: titleC,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Add body text"),
              controller: descC,
              maxLines: 5,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              width: 80,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    String title = titleC.text;
                    String desc = descC.text;
                    ItemSelectionController(
                      child: ListView.builder(
                        itemCount: user?.communities?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(user?.communities?.elementAt(index)?.name ?? 'nulllll'),
                            onTap: () {
                              setState(() {
                                community = user?.communities?.elementAt(index);
                              });
                            },
                          );
                        },
                      ),
                    );
                    Post post = Post(title: title, content: desc, user: user, community: community, image: null, likeCount: 0, comments: null);
                    widget.user.addPost(post);
                    community?.addPost(post);
                    titleC.clear();
                    descC.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Add", )),
            )
          ],
        ),
      ),
    );
  }
}