import 'package:find_talent/screens/counter/counter_provider.dart';
import 'package:find_talent/screens/counter/couter.dart';
import 'package:find_talent/screens/curved_line_screen/index.dart';
import 'package:find_talent/screens/welcome/welcome.dart';
import 'package:find_talent/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MyApp());
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Talent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepOrange,
        // iconTheme: IconThemeData(color: Colors.white),
        // accentIconTheme: IconThemeData(color: Colors.grey),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: ftTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/curved': (context) => CurvedScreen(),
        '/counter': (context) => CounterScreen()
      },
    );
  }
}
