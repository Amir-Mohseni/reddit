import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Classes/Community.dart';

class OpenCommunity extends StatefulWidget {
  OpenCommunity(
      {required Key key, required this.community})
      : super(key: key);

  Community community;

  @override
  State<OpenCommunity> createState() => _OpenCommunityState();
}

class _OpenCommunityState extends State<OpenCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListTile(
          title: Text(widget.community.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          subtitle: Text("\n\n" + widget.community.description + "\n\n\n",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.edit),
        ),
      ),
    );
  }
}