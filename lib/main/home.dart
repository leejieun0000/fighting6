import 'package:flutter/material.dart';
import 'package:project1/main/alarm.dart';
import 'package:project1/navigators/HomeButtonNavigator.dart';
import 'package:project1/main/user_setting.dart';

class MyHome extends StatefulWidget{
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome>{
  int _currentTabIndex = 1;
  final screens = [
    Alarm(tabIndex: 0),
    HomeButtonNavigator(tabIndex: 1),
    UserSetting(tabIndex: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentTabIndex],
      // Stack(
      //     children: [
      //   Offstage(
      //     offstage: _currentTabIndex != 0,
      //     child: Alarm(tabIndex: 0),
      //   ),
      //   Offstage(
      //     offstage: _currentTabIndex != 1,
      //     child: HomeButtonNavigator(tabIndex: 1),
      //   ),
      //   Offstage(
      //     offstage: _currentTabIndex != 2,
      //     child: UserSetting(tabIndex: 2),
      //   ),
      // ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        currentIndex: _currentTabIndex,
        onTap: (index){
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              /*icon: Icon(Icons.notifications_none),
              label: '알림'*/
              icon: Icon(Icons.notifications,size: 30),
              label: ''
          ),
          BottomNavigationBarItem(
              /*icon: Icon(Icons.home),
              label: 'home'*/
              icon: Icon(Icons.home,size: 30),
              label: ''
          ),
          BottomNavigationBarItem(
            /*icon: Icon(Icons.person_outline),
            label: '설정'*/
              icon: Icon(Icons.person,size: 30,),
              label: ''
          ),
        ],
      ),
    );
  }
}