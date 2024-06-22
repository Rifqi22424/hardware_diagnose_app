import 'package:flutter/material.dart';
import 'widgets/question_widget.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuestionWidget(),
    theme: ThemeData(useMaterial3: false),
  ));
}
