/*import 'package:flutter/material.dart';
import 'package:project1/main/home.dart';
import 'package:project1/main/join.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(login());
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffFFE072),
          centerTitle: true,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // datePickerTheme: DatePickerThemeData(
        //
        // ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                    child: Center(
                      child: Image(
                        image: AssetImage('images/login_yw.png'),
                        width: 430,
                        height: 430,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 20.0),
                    child: TextField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        labelText: '아이디',
                        //hintText: 'abcde',
                        labelStyle: TextStyle(color: Colors.grey),
                        isDense: true,
                        contentPadding: EdgeInsets.all(17.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        labelText: '비밀번호',
                        //hintText: '12345',
                        labelStyle: TextStyle(color: Colors.grey),
                        isDense: true,
                        contentPadding: EdgeInsets.all(17.0),
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0.0, 0.0),
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHome()),
                        );
                      },
                      child: const Text('로그인',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color(0xffFFD76F),
                        minimumSize: Size(400, 50),
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0.0, 0.0),
                    padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                    child: TextButton(
                      child: Text(
                        "회원가입",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'images/dongnae.png',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:project1/main/home.dart';
import 'package:project1/main/join.dart';
import 'package:project1/main/home.dart';
import 'package:project1/main/join.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(login());
}
class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffFFE072),
          centerTitle: true,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
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
      resizeToAvoidBottomInset: false,  // 키보드가 올라와도 화면 크기를 변경하지 않음
      body: Stack(
        children: [
      SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
           SizedBox(
             height: 80,
           ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Image.asset(
              'images/login_yw.png',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10, 30.0, 20.0),
              child: TextField(
                // obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  labelText: '아이디',
                  //hintText: 'abcde',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  labelText: '비밀번호',
                  //hintText: '12345',
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
                child: const Text('로그인',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),
                    backgroundColor: Color(0xffFFE072),
                    minimumSize: Size(400, 50),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(0.0, 0.0),
              padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 10.0),
              child:TextButton(
                child: Text("회원가입",
                    style: TextStyle(fontSize: 20),),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'images/dongnae.png',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
      ),
    );
  }
}
