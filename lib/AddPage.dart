import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:reddit/taskclass.dart';

class AddPage extends StatefulWidget {
  final Function addTask;

  AddPage(this.addTask);

  @override
  State<AddPage> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddPage> {
  TextEditingController titlec, desc;
  DateTime daytime;
  TimeOfDay timeOfDay;
  String userError, desError;

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        timeOfDay = _time;
      });
    }
  }

  @override
  void initState() {
    titlec = TextEditingController();
    desc = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    titlec.dispose();
    desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(73, 215, 164, 1.0),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 8.0),
              child: TextField(
                controller: titlec,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    errorText: userError,
                    hintText: "Title",
                    contentPadding:
                        const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 8.0),
              child: TextField(
                controller: desc,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "description",
                    errorText: desError,
                    contentPadding:
                        const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              ),
            ),
            Container(
                margin: EdgeInsets.all(10.0),
                // padding: EdgeInsets.all(16.0),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(50.0, 14.0, 50.0, 14.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  color: Colors.blueAccent,
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                      daytime = date;
                    }, onConfirm: (date) {
                      print('confirm $daytime');
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: const Text(
                    '  DATE  ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 0, 7.0),
              child: MaterialButton (
                padding: const EdgeInsets.fromLTRB(34.0, 14.0, 34.0, 14.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                color: Colors.blueAccent,
                onPressed: _selectTime,
                child: const Text('SELECT TIME',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, )),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 8.0),
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                color: Colors.blueAccent,
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    if (titlec.text.length < 3) {
                      userError = "username must be > 4";
                    } else if (desc.text.length < 4) {
                      userError = null;
                      desError = "password must be > 4";
                    } else {
                      userError = null;
                      desError = null;
                      widget.addTask(TaskClass(
                          titlec.text, desc.text, daytime, timeOfDay));
                      Future.delayed(Duration(milliseconds: 500), () {
                        Navigator.pop(context);
                      });
                    }
                  });
                },
                child: const Text(
                  "ADD",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
