import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  //MaterialApp provides shell with behind the scene configuration for actual user interface we are gona display. SET UP GENERAL APP SHELL
  //Scaffold used to set up screen displayed to user
  runApp(const Quiz()); //can use 'Quiz' widget cuz inside it uses 'MaterialApp'
}  