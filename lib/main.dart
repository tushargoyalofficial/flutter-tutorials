import 'package:find_talent/screens/curved_line_screen/index.dart';
import 'package:find_talent/settings/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorials',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepOrange,
        iconTheme: IconThemeData(color: Colors.white),
        accentIconTheme: IconThemeData(color: Colors.grey),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: ftTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CurvedScreen(),
    );
  }
}
