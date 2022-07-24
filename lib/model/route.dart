import 'package:brancher_chatapp/view/screens/authenticationscreen/logout_login.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/signinscreen.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/signupscreen.dart';

import 'package:flutter/material.dart';

class RouterScreen {
  static Map<String, Widget Function(BuildContext)> routescreen() {
    return {
      "/signin": (context) => const SignIn(),
      "/signup": (context) => const SignUp(),
      "/signin-signout": (context) => const LogoutLogin(),
    };
  }
}
