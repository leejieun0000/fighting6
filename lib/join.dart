import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'join',
      debugShowCheckedModeBanner: false,
      home: JoinWidget(),
    );
  }
}

class JoinWidget extends StatefulWidget {
  const JoinWidget({Key? key}) : super(key: key);

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  bool _isCheckMan = false;
  bool _isCheckWeman = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffFFE072),
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
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
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
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  labelText: '비밀번호',
                  hintText: '비밀번호',
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
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  labelText: '비밀번호 확인',
                  hintText: '비밀번호 확인',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
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
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 5.0),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xffFFE072),
                    checkColor: Colors.white,
                    value: _isCheckMan,
                    onChanged: (value) {
                      setState(() {
                        _isCheckMan = value!;
                        _isCheckWeman = !value;
                      });
                    },
                  ),
                  const Text("남성",
                    style: TextStyle(color: Colors.black),),
                  Checkbox(
                    activeColor: Color(0xffFFE072),
                    checkColor: Colors.white,
                    value: _isCheckWeman,
                    onChanged: (value) {
                      setState(() {
                        _isCheckWeman = value!;
                        _isCheckMan = !value;
                      });
                    },
                  ),
                  const Text("여성",
                    style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
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
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
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
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 5.0),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xffFFE072),
                    checkColor: Colors.white,
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Text("개인정보 이용에 동의합니다.",
                    style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
            Container(
              alignment: const Alignment(0.8, 0.0),
              padding: const EdgeInsets.only(right: 5.0),
              child: ElevatedButton(
                onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const CheckBoxs()),
                  // );
                },
                child: const Text('완료'),
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