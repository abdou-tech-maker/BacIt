import 'package:flutter/material.dart';
import 'Views/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Bachelors App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Login(),
    );
  }
}
