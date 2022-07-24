import 'package:brancher_chatapp/model/enums/enums.dart';
import 'package:flutter/cupertino.dart';

class SignUpSignInView extends ChangeNotifier {
  Toggle _toggle = Toggle.signup;

  Toggle get toggle => _toggle;

  void signIn() {
    _toggle = Toggle.signin;
    notifyListeners();
  }

  void signUp() {
    _toggle = Toggle.signup;
    notifyListeners();
  }

  void forgetpassword() {
    _toggle = Toggle.forgetpassword;
    notifyListeners();
  }
}
