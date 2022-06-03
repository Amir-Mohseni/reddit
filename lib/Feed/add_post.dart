import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classes/Post.dart';
import '../Classes/User.dart';


class AddPost extends StatefulWidget {
  User user;
  AddPost({required Key key, required this.addNewPost, required this.user}) : super(key: key);
  final Function addNewPost;

  @override
  State<AddPost> createState() => _AddPostState(user: user, addNewPost: addNewPost);
}

class _AddPostState extends State<AddPost> {
  User? user;
  Function addNewPost;
  late TextEditingController titleC;
  late TextEditingController descC;
  late DateTime dateC;

  _AddPostState({required this.user, required this.addNewPost});

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
              decoration: const InputDecoration(hintText: "Title"),
              controller: titleC,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Descriptions"),
              controller: descC,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              width: 80,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    String title = titleC.text;
                    String desc = descC.text;
                    Post post = Post(content: title, user: user, image: null, likeCount: 0, like: null, comments: null);
                    widget.user.addPost(post);
                    titleC.clear();
                    descC.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}