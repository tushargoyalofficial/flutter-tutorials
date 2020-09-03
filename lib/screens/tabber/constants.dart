import 'package:flutter/material.dart';

class TabData {
  const TabData(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<TabData> allDestinations = <TabData>[
  TabData('Dashboard', Icons.dashboard, Colors.teal),
  TabData('Search', Icons.search, Colors.cyan),
  TabData('Favorite', Icons.favorite, Colors.orange),
  TabData('Profile', Icons.person, Colors.blue)
];
