import 'package:find_talent/settings/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: ftTextWhiteColor,
                      fontSize: 40.0,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/counter');
                  },
                  child: Text('Counter'),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/curved');
        },
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.chevron_right,
          color: Colors.redAccent,
          size: 40.0,
        ),
      ),
    );
  }
}
