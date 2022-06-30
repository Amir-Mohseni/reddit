import 'package:flutter/material.dart';

class TaskClass {
  String name;
  String purpose;
  bool done=false;
  DateTime dateTime;
  TimeOfDay timeOfDay;

  TaskClass(this.name, this.purpose, this.dateTime, this.timeOfDay);
}
