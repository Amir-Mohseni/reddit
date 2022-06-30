// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reddit/taskclass.dart';
import 'package:todolist/TaskShowpage.dart';
import 'package:todolist/taskclass.dart';

class TaskShow extends StatefulWidget {
  TaskClass task;
  Function isDone;
  Function remove;
  TaskShow(this.task, this.isDone, this.remove);

  @override
  State<TaskShow> createState() => _TaskShowState();
}

class _TaskShowState extends State<TaskShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GFListTile(
        color: const Color.fromRGBO(54, 182, 18, 0.9019607843137255),
        description: Text(widget.task.purpose),
        titleText: widget.task.name,
        icon: GestureDetector(
          onTap: () {
            widget.isDone();
          },
          child: widget.task.done
              ? Container(
                  child: const Icon(Icons.check_circle),
                  color: Color.fromRGBO(0, 150, 10, 1.0),
                )
              : Container(
                  child: const Icon(Icons.check_circle_outline),
                ),
        ),
        hoverColor: const Color.fromRGBO(10, 50, 150, 1),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TaskShowPage(widget.task);
              },
            ),
          );
        },
        onLongPress: () {
          print("fnksdvdk");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.greenAccent,
              title: Text("Do You Wanna Delete"),
              actions: [
                FlatButton(
                    onPressed: () {
                      print("151515");
                      widget.remove(widget.task);
                      Navigator.of(context).pop();
                    },
                    child: Text("Yes"))
              ],
            ),
          );
        },
      ),
    );
  }
}
