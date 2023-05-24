import 'package:flutter/material.dart';
import 'package:project1/main.dart';

class JoinWidget extends StatefulWidget {
  const JoinWidget({Key? key}) : super(key: key);

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
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
                controller: _usernameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  labelText: '아이디(닉네임)',
                  hintText: '아이디(닉네임)',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),  //아이디 필드
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 7.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                onChanged: (_) => _validatePassword(),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isPasswordLengthValid ? Colors.black: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isPasswordLengthValid ? Colors.grey : Colors.red,
                      width: 1.0,
                    ),
                  ),
                  labelText: '비밀번호',
                  hintText: '비밀번호',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),  //비밀번호 필드
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '비밀번호는 8~12자 이내이어야 합니다.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '영문자와 숫자가 모두 포함되어야 합니다.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),)

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 25.0),
              child: TextField(
                obscureText: true,
                controller: _confirmPasswordController,
                onChanged: (_) => _validatePassword(),
                onTap: () {
                  setState(() {
                    _isConfirmPasswordFocused = true;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isPasswordMatch ? Colors.black : Colors.black,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isPasswordMatch ? Colors.grey : Colors.red,
                      width: 1.0,
                    ),
                  ),
                  labelText: '비밀번호 확인',
                  hintText: '비밀번호 확인',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ), //비밀번호 확인 필드
            if (!_isPasswordMatch &&
                _confirmPasswordController.text.length > 0)
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '비밀번호와 일치하지 않습니다.',
                    style: TextStyle(fontSize: 12.0, color: Colors.red),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  labelText: '이름',
                  hintText: '이름',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),  //이름 필드
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
                        _isCheckWoman = !value;
                      });
                    },
                  ),
                  const Text(
                    '남성',
                    style: TextStyle(color: Colors.black),
                  ),
                  Checkbox(
                    activeColor: Color(0xffFFE072),
                    checkColor: Colors.white,
                    value: _isCheckWoman,
                    onChanged: (value) {
                      setState(() {
                        _isCheckWoman = value!;
                        _isCheckMan = !value;
                      });
                    },
                  ),
                  const Text(
                    '여성',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),  // 성별 체크박스
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  labelText: '전화번호',
                  hintText: '전화번호',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),  //전화번호 필드
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  labelText: '주소',
                  hintText: '주소',
                  labelStyle: TextStyle(color: Colors.grey),
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.0),
                ),
              ),
            ),   //주소 필드
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
            ),  //개인정보 동의 체크박스
            Container(
              alignment: const Alignment(0.8, 0.0),
              padding: const EdgeInsets.only(right: 5.0),
              child: ElevatedButton(
                onPressed: _isFormValid()
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginWidget(),
                    ),
                  );
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
