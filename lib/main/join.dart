import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinWidget extends StatefulWidget {
  const JoinWidget({Key? key}) : super(key: key);

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  bool _isCheckMan = false;
  bool _isCheckWoman = false;
  bool _isChecked = false;

  bool _isPasswordLengthValid = true;
  bool _isPasswordMatch = true;
  bool _isConfirmPasswordFocused = false;

  void _validatePassword() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Validate password length and pattern
    bool isPasswordValid = password.length >= 8 && password.length <= 12;
    bool isPasswordPatternValid =
    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$').hasMatch(password);

    setState(() {
      _isPasswordLengthValid = isPasswordValid && isPasswordPatternValid;
      if (_isConfirmPasswordFocused) {
        _isPasswordMatch = password == confirmPassword;
      }
    });
  }

  bool _isFormValid() {
    return _isPasswordLengthValid &&
        _isPasswordMatch &&
        (_isCheckMan || _isCheckWoman) &&
        _isChecked &&
        _isAllTextFieldsFilled();
  }

  bool _isAllTextFieldsFilled() {
    return _textFieldHasValidInput(_usernameController) &&
        _textFieldHasValidInput(_passwordController) &&
        _textFieldHasValidInput(_confirmPasswordController) &&
        _textFieldHasValidInput(_nameController) &&
        _textFieldHasValidInput(_phoneController) &&
        _textFieldHasValidInput(_addressController);
  }

  bool _textFieldHasValidInput(TextEditingController controller) {
    return controller.text.trim().isNotEmpty && !controller.text.startsWith(' ');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원가입',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
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
