import 'package:flutter/material.dart';
import 'package:project1/home.dart';
import 'package:project1/join.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffFFE072),
          centerTitle: true,
        )
      ),
      home: LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100,
            ),
            Container(
              width: 300,
              height: 300,
              margin: EdgeInsets.fromLTRB(40, 50, 40, 10),
              decoration: BoxDecoration(
                color: Color(0xffFFE072),
                borderRadius: BorderRadius.circular(30),
              ),
                child:Center(
                  child:Image(
                    image:AssetImage("images/loginpicture.png"),
                    width: 270,
                    height: 270,
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              child: TextField(
                // obscureText: true,
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
                  labelText: '아이디',
                  hintText: 'abcde',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
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
                  labelText: '비밀번호',
                  hintText: '12345',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(0.0, 0.0),
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHome()),
                  );
                },
                child: const Text('로그인'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFFE072),
                  minimumSize: Size(400, 50),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(0.0, 0.0),
              padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 10.0),
              child:TextButton(
                child: Text("회원가입"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JoinWidget()),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

