import 'package:flutter/material.dart';
import 'package:project1/main/alarm.dart';
import 'package:project1/main/home_button.dart';

class AlarmNavigator extends StatelessWidget {
  const AlarmNavigator({super.key, required this.tabIndex});
  final int tabIndex;

  Map<String, WidgetBuilder> _routeBuilder(BuildContext context) {
    return {
      "/" : (context) => HomeButton(
        tabIndex: tabIndex,
      ),
      "/Alarm": (context) => Alarm(
        tabIndex: tabIndex,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilder = _routeBuilder(context);
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: ((settings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilder[settings.name!]!(context),
        );
      }),
    );
  }
}