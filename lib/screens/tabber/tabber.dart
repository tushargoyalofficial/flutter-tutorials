import 'package:find_talent/screens/tabber/constants.dart';
import 'package:find_talent/screens/tabber/tabber_body.dart';
import 'package:find_talent/screens/tabber/tabber_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabberScreen extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabber'),
        centerTitle: true,
      ),
      body: TabberBody(navigatorKey: _navigatorKey),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 5.0,
              spreadRadius: 1.0)
        ]),
        child: BottomNavigationBar(
          currentIndex: context.watch<TabberProvider>().tabIndex,
          items: allTabPages.map((TabData destination) {
            return BottomNavigationBarItem(
                icon: Icon(destination.icon),
                backgroundColor: destination.color,
                title: Text(destination.title, style: TextStyle(height: 1.4)));
          }).toList(),
          onTap: (int val) =>
              context.read<TabberProvider>().onTabPress(val, _navigatorKey),
        ),
      ),
    );
  }
}
