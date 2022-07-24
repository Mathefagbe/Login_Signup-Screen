import 'package:brancher_chatapp/model/enums/enums.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/signinscreen.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/signupscreen.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/signin_signupview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpSignIn extends StatelessWidget {
  const SignUpSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var toggle = Provider.of<SignUpSignInView>(context).toggle;
    return toggle == Toggle.signup ? const SignUp() : const SignIn();
  }
}
