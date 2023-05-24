import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinWidget extends StatefulWidget {
  // const JoinWidget({Key? key}) : super(key: key);

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: emailController.text,
      );
      showToast('회원가입 성공: ${userCredential.user!.email}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const login()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('비밀번호가 너무 약합니다');
      } else if (e.code == 'email-already-in-use') {
        showToast('이미 사용 중인 이메일입니다');
      } else {
        showToast('회원 가입 오류: ${e.code}');
      }
    } catch (e) {
      showToast('기타 오류: $e');
    }
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
              onPressed: signUp,
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}