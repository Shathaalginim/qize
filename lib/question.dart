import 'package:flutter/material.dart';

class Question {
  String q;
  List<String> a;
  int ca;
  String i;
  Color backgroundColor = Colors.black; // define the property here

  Question({
    required this.q,
    required this.a,
    required this.ca,
    required this.i,
  });
}
