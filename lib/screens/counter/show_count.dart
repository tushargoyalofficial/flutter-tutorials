import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class ShowCount extends StatelessWidget {
  const ShowCount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [CounterScreen] rebuild when [CounterProvider] changes.
        '${context.watch<CounterProvider>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}
