import 'package:find_talent/screens/tabber/tabber.dart';
import 'package:flutter/material.dart';
import 'package:find_talent/screens/counter/couter.dart';
import 'package:find_talent/screens/curved_line_screen/index.dart';
import 'package:find_talent/screens/welcome/welcome.dart';

Map<String, Widget Function(BuildContext)> appRoutes = <String, WidgetBuilder>{
  '/welcome': (context) => WelcomeScreen(),
  '/curved': (context) => CurvedScreen(),
  '/counter': (context) => CounterScreen(),
  '/tabs': (context) => TabberScreen(),
};
