import 'package:flutter/material.dart';
import 'package:namer_app/screens/user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserScreen(), // no const needed here
    );
  }
}
