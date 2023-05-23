import 'package:flutter/material.dart';
import 'package:project1/main.dart';

class InformationChange extends StatefulWidget {
  const InformationChange({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;


  @override
  _informationChange createState() => _informationChange();
}


class _informationChange extends State<InformationChange>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('회원정보 수정',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
         backgroundColor: const Color(0xFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 25.0),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  labelText: '아이디(닉네임)',
                  hintText: '아이디(닉네임)',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 25.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  labelText: '이름',
                  hintText: '이름',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 25.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  labelText: '전화번호',
                  hintText: '전화번호',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE072),
                      width: 1.0,),
                  ),
                  labelText: '주소',
                  hintText: '주소',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(0.8, 0.0),
              padding: const EdgeInsets.only(right: 5.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginWidget()),
                  );
                },
                child: const Text('수정'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFFE072),
                  minimumSize: Size(100, 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}