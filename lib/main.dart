import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/main/home.dart';
import 'package:project1/main/join.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
  // const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  
  Future<void> singIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      showToast('로그인 성공: ${userCredential.user!.email}');
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHome()),
            );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('등록되지 않은 이메일입니다');
      } else if (e.code == 'wrong-password') {
        showToast('비밀번호가 틀렸습니다');
      } else {
        showToast('로그인 오류: ${e.code}');
      }
    } catch (e) {
      showToast('기타 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: '이메일',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: singIn,
              //     () async {
              //   try {
              //     UserCredential userCredential = await FirebaseAuth.instance
              //         .signInWithEmailAndPassword(
              //         email: emailController.text,
              //         password: passwordController.text) //아이디와 비밀번호로 로그인 시도
              //         .then((value) {
              //       print(value);
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => const MyHome()),
              //       );
              //       return value;
              //     });
              //   } on FirebaseAuthException catch (e) {
              //     //로그인 예외처리
              //     if (e.code == 'user-not-found') {
              //       print('등록되지 않은 이메일입니다');
              //     } else if (e.code == 'wrong-password') {
              //       print('비밀번호가 틀렸습니다');
              //     } else {
              //       print(e.code);
              //     }
              //   }
              // },
              child: Text('로그인'),
            ),
            SizedBox(height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JoinWidget()),
                );
              },
              child: Text('회원 가입'),
            ),
          ],
        ),
      ),
    );
  }
}