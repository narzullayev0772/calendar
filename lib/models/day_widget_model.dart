import 'package:flutter/material.dart';

class DayWidgetModel {
  Color color;
  Color backgroundColor;
  int day;
  int type;

  DayWidgetModel({
    required this.day,
    this.color = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.type = 0,
  });

  // empty day
  static DayWidgetModel fromDay(int day) {
    return DayWidgetModel(
      color: Colors.black,
      backgroundColor: Colors.transparent,
      day: day,
    );
  }
}
