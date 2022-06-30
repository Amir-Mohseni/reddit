import 'package:flutter/material.dart';
import 'package:reddit/taskclass.dart';

class TaskShowPage extends StatefulWidget {
  final TaskClass taskClass;
  TaskShowPage(this.taskClass);

  @override
  State<TaskShowPage> createState() => _TaskShowPageState();
}

class _TaskShowPageState extends State<TaskShowPage> {

  dynamic date ;

  @override
  Widget build(BuildContext context) {
    date=widget.taskClass.dateTime.toString().substring(0,10);
    print(date);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 200, 100, 1),
      body: Column(
        children: [
          Container(//title
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            color: Colors.cyanAccent,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Title : ${widget.taskClass.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(10, 120, 200, 1)),
              ),
            ),
          ),
          Container(//DES
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            color: Colors.cyanAccent,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "description ${widget.taskClass.purpose}",
                style: const TextStyle(color: Color.fromRGBO(10, 120, 200, 1),fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Container(//DATE
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            color: Colors.cyanAccent,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Date : $date  ${widget.taskClass.timeOfDay.toString().substring(9)}",
                style: const TextStyle(color: Color.fromRGBO(10, 120, 200, 1)),
              ),
            ),
          ),
          Container(
            child: BackButton(
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
