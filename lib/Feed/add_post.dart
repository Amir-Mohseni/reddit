import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:item_selector/item_selector.dart';

import '../Classes/Community.dart';
import '../Classes/Post.dart';
import '../Classes/User.dart';

class AddPost extends StatefulWidget {
  User user;
  Function addPost;

  AddPost({required Key key, required this.user, required this.addPost})
      : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState(user: user);
}

class _AddPostState extends State<AddPost> {
  User? user;
  Community? community;
  late TextEditingController titleC;
  late TextEditingController descC;
  late DateTime dateC;
  final ImagePicker _picker = ImagePicker();
  File? image;

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
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(children: [
          TextField(
            controller: titleC,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: descC,
            decoration: InputDecoration(
              labelText: "Description",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () async {
              final pickedFile =
                  await _picker.getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                setState(() {
                  image = File(pickedFile.path);
                });
              }
            },
            child: Text("Select Image"),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
                print("dtjkxzhjzhjzzhhj");
                widget.addPost(
                  Post(
                  title: titleC.text,
                  content: descC.text,
                  community: community,
                  user: user,
                  image: image,
                ),
                  user,
                );
                Navigator.pop(context);
              }
            },
            child: Text("Add Post"),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ]),
      ),
    );
  }
}
