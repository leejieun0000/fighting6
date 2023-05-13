import 'package:flutter/material.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
          title: Text(
            '자취생 도우미',
            style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold
            ),
          ),
          automaticallyImplyLeading: false
      ),
      body: Center(
        child: Text('설정'),
      ),
    );
  }
}