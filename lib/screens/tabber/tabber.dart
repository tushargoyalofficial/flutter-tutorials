import 'package:find_talent/screens/tabber/constants.dart';
import 'package:find_talent/screens/tabber/tabber_body.dart';
import 'package:find_talent/screens/tabber/tabber_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabberScreen extends StatefulWidget {
  @override
  _TabberScreenState createState() => _TabberScreenState();
}

class _TabberScreenState extends State<TabberScreen>
    with TickerProviderStateMixin<TabberScreen> {
  List<Key> _destinationKeys;
  List<AnimationController> _faders;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    // calling provider in initstate is good idea then calling it in `didChangeDependicies`
    // also while calling, pass `listen: false`
    var tabProviderData = Provider.of<TabberProvider>(context, listen: false);

    _faders = allTabPages.map<AnimationController>((TabData destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[tabProviderData.tabIndex].value = 1.0;
    _destinationKeys =
        List<Key>.generate(allTabPages.length, (int index) => GlobalKey())
            .toList();
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }

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
