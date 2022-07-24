import 'package:brancher_chatapp/model/enums/enums.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/homeverify.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/signup_signin_screen.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/authenticaton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutLogin extends StatelessWidget {
  const LogoutLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appstate = Provider.of<Authenticaton>(context).appState;
    if (appstate == AppState.logout) {
      return const SignUpSignIn();
    } else {
      return const HomeVerify();
    }
  }
}
