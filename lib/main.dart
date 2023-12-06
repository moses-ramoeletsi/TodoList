import 'package:flutter/material.dart';
import 'package:first_app/todo_list.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoList(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
