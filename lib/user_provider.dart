import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  bool _userLoggedIn = false;

  void SetUserAuth(bool authSate){
    _userLoggedIn = authSate;
    notifyListeners();
  }

  bool get userState => _userLoggedIn;
}