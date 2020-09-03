import 'package:find_talent/screens/tabber/tabber_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabber'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text('Tabber screen')],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.deepPurple[200],
              offset: Offset(0, 0),
              blurRadius: 5.0,
              spreadRadius: 1.0)
        ]),
        child: BottomNavigationBar(
            currentIndex: context.watch<TabberProvider>().tabIndex,
            onTap: (int val) => context.read<TabberProvider>().onTabPress(val),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.search),
                  title: const Text('Search'),
                  backgroundColor: Colors.indigo),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  title: const Text('Profile'),
                  backgroundColor: Colors.orange)
            ]),
      ),
    );
  }
}
