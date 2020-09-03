import 'package:find_talent/screens/dashboard/dashboard.dart';
import 'package:find_talent/screens/favs/favs.dart';
import 'package:find_talent/screens/profile/profile.dart';
import 'package:find_talent/screens/search/search.dart';
import 'package:flutter/material.dart';

class TabberBody extends StatelessWidget {
  const TabberBody({
    Key key,
    @required GlobalKey<NavigatorState> navigatorKey,
  })  : _navigatorKey = navigatorKey,
        super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigatorKey.currentState.canPop()) {
          _navigatorKey.currentState.pop();
          return false;
        }
        return true;
      },
      child: Navigator(
          key: _navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            // Manage your route names here
            switch (settings.name) {
              case '/':
                builder = (BuildContext context) => DashboardScreen();
                break;
              case '/search':
                builder = (BuildContext context) => SearchScreen();
                break;
              case '/favs':
                builder = (BuildContext context) => FavsScreen();
                break;
              case '/profile':
                builder = (BuildContext context) => ProfileScreen();
                break;
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
            // You can also return a PageRouteBuilder and
            // define custom transitions between pages
            return MaterialPageRoute(
              builder: builder,
              settings: settings,
            );
          }),
    );
  }
}
