import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/main/home.dart';
import 'package:project1/main/join.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/user_provider.dart';
import 'package:provider/provider.dart';

// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(login());
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context){
        return UserProvider();
      },
      child: MaterialApp(
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
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

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

  /*void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }*/

  void showToast(BuildContext context, String message, IconData iconData) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Color(0xfffd9b13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Icon(iconData, color: Colors.white),
                  SizedBox(width: 10),
                  Text(message, style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ],
      ),
    ));

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }


  Future<void> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      showToast(context, '${userCredential.user!.email}님, 환영합니다!', Icons.check);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHome()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(context, '등록되지 않은 이메일입니다', Icons.error_outline);
      } else if (e.code == 'wrong-password') {
        showToast(context, '비밀번호가 틀렸습니다', Icons.error_outline);
      } else {
        showToast(context, '로그인 오류: ${e.code}', Icons.error_outline);
      }
    } catch (e) {
      showToast(context, '기타 오류: $e', Icons.error_outline);
    }
  }

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
                        image: AssetImage('images/mate.png'),
                        width: 430,
                        height: 430,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                        //hintText: 'abcde',
                        labelStyle: TextStyle(color: Colors.grey),
                        isDense: true,
                        contentPadding: EdgeInsets.all(17.0),
                      ),
                      controller: emailController,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                        //hintText: 'abcde',
                        labelStyle: TextStyle(color: Colors.grey),
                        isDense: true,
                        contentPadding: EdgeInsets.all(17.0),
                      ),
                      controller: passwordController,
                      obscureText: true,
                    ),
                  ),


                  Container(
                    alignment: const Alignment(0.0, 0.0),
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10),
                    child: ElevatedButton(
                      onPressed: signIn,
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
}
