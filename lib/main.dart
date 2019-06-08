import 'package:flutter/material.dart';
import 'package:todoapp/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: 'Product'),
      home: HomePage(),
    );
  }
}