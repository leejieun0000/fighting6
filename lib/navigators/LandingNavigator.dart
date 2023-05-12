import 'package:flutter/material.dart';
import 'package:project1/Landing_S.dart';
import 'package:project1/home_button.dart';

class LandingNavigator extends StatelessWidget{
  const LandingNavigator({super.key, required this.tabIndex});
  final int tabIndex;

  Map<String, WidgetBuilder> _routeBuilder(BuildContext context) {
    return {
      "/" : (context) => HomeButton(
        tabIndex: tabIndex,
      ),
      "/LandingSetting": (context) => LandingSetting(
        tabIndex: tabIndex,
      ),
    };
  }

  @override
  Widget build(BuildContext context){
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