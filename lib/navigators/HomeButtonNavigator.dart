import 'package:flutter/material.dart';
import 'package:project1/land_borrow/Landing_S.dart';
import 'package:project1/land_borrow/borrwoing.dart';
import 'package:project1/gonggu/gonggu1.dart';
import 'package:project1/gonggu/gonggu_write.dart';
import 'package:project1/land_borrow/lending.dart';
import 'package:project1/main/home_button.dart';
import 'package:project1/information/information1.dart';
import 'package:project1/land_borrow/writing.dart';

class HomeButtonNavigator extends StatelessWidget{
  const HomeButtonNavigator({super.key, required this.tabIndex});
  final int tabIndex;

  Map<String, WidgetBuilder> _routeBuilder(BuildContext context) {
    return {
      "/" : (context) => HomeButton(
        tabIndex: tabIndex,
      ),
      "/LandingSetting": (context) => LandingSetting(
        tabIndex: tabIndex,
      ),
      "/Information": (context) => Information(
        tabIndex: tabIndex,
      ),
      "/Gonggu": (context) => Gonggu(
        tabIndex: tabIndex,
      ),
      "/Borrowing": (context) => Borrowing(
        tabIndex: tabIndex,
      ),
      "/writingWidget": (context) => writingWidget(
      ),
      "/GongguWrite": (context) => GongguWrite(
      ),
      "/lending": (context) => lending(
        //tabIndex: tabIndex,
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