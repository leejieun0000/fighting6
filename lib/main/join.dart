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
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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


  bool _isChecked = false;

  bool _isPasswordLengthValid = true;
  bool _isPasswordMatch = true;
  bool _isConfirmPasswordFocused = false;

  void _validatePassword() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

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
        _isChecked &&
        _isAllTextFieldsFilled();
  }

  bool _isAllTextFieldsFilled() {

    return
        _textFieldHasValidInput(emailController) &&
        _textFieldHasValidInput(passwordController) &&
        _textFieldHasValidInput(confirmPasswordController) &&
        _textFieldHasValidInput(nameController) &&
        _textFieldHasValidInput(phoneController) &&
        _textFieldHasValidInput(addressController);
  }

  bool _textFieldHasValidInput(TextEditingController controller) {
    return controller.text.trim().isNotEmpty && !controller.text.startsWith(' ');
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    confirmPasswordController.addListener(() {
      setState(() {});
    });
    nameController.addListener(() {
      setState(() {});
    });
    phoneController.addListener(() {
      setState(() {});
    });
    addressController.addListener(() {
      setState(() {});
    });
    confirmPasswordController.addListener(() {
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;
      _isPasswordMatch = password == confirmPassword;
      setState(() {});
    });
  }

  @override
  void dispose() {
    confirmPasswordController.removeListener(() {});
    nameController.removeListener(() {});
    phoneController.removeListener(() {});
    addressController.removeListener(() {});
    emailController.removeListener(() {});
    passwordController.removeListener(() {});
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black,
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
                  labelText: '이메일',
                  //hintText: '이메일',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black,
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
                  //hintText: '비밀번호',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
                obscureText: true,
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: TextFormField(
                obscureText: true,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value != passwordController.text) {
                    return '비밀번호가 일치하지 않습니다';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: _isPasswordMatch ? Colors.black : Colors.pink,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: _isPasswordMatch ? Colors.grey : Colors.red,
                      width: 1.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.pink,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.pink,
                      width: 1.0,
                    ),
                  ),
                  labelText: '비밀번호 확인',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black,
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
                  labelText: '이름',
                  //hintText: '이름',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black,
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
                  labelText: '전화번호',
                  //hintText: '전화번호',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black,
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
                  labelText: '주소',
                  //hintText: '주소',
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
                  const Text(
                    '개인정보 이용에 동의합니다.',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),


            Container(
              alignment: const Alignment(0.8, 0.0),
              padding: const EdgeInsets.only(right: 5.0),
              child: ElevatedButton(
                onPressed: _isFormValid()
                    ? () {
                        signUp();
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginWidget(),
                    ),
                  );*/
                }
                    : null,
                child: const Text('완료'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  _isFormValid() ? Color(0xffFFE072) : Colors.grey,
                  minimumSize: const Size(100, 40),
                ),
              ),
            ),  //완료 버튼


          ],
        ),
      ),
    );
  }
}
