import 'package:flutter/material.dart';
import 'package:team_intervel_test/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST',
      theme: ThemeData(
        primaryColor: Color(0xFFee7b64),
      ),
      home: LoginPage(),
    );
  }
}
