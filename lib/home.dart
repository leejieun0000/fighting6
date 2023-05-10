import 'package:flutter/material.dart';
import 'package:project1/LB_page.dart';
import 'package:project1/home_button.dart';

class MyHome extends StatefulWidget{
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome>{
  int _currentTabIndex = 1;

  void _tabSelect(int tabIndex){
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  // List<Widget> _tapNavigatorBuilder(){
  //   return [
  //
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(
          '자취생 도우미',
        ),
        automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //     onPressed: (){},
        //     icon: Icon(Icons.search),
        //   ),
        //   IconButton(
        //     onPressed: (){},
        //     icon: Icon(Icons.list),
        //   ),
        //   IconButton(
        //     onPressed: (){},
        //     icon: Icon(Icons.notifications),
        //   ),
        // ],
      ),
      body: IndexedStack(
        index: _currentTabIndex,
        children: [
          Container(
            color: Colors.accents[0],
          ),
          HomeButton(),
          Container(
            color: Colors.white,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index){
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '알림'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: '설정'
          ),
        ],
      ),
    );
  }
}