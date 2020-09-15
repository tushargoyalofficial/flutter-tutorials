import 'package:find_talent/screens/faded_tabber/tab_list.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/list");
          },
          child: Center(
            child: Text('tap here'),
          ),
        ),
      ),
    );
  }
}
