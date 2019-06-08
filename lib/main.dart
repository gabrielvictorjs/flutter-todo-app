import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo",
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: 'Product'),
      home: HomeScreen(),
    );
  }
}