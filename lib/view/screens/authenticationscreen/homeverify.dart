import 'package:brancher_chatapp/view/screens/authenticationscreen/verification.dart';
import 'package:brancher_chatapp/view/screens/home.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/verificationmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeVerify extends StatefulWidget {
  const HomeVerify({Key? key}) : super(key: key);

  @override
  State<HomeVerify> createState() => _HomeVerifyState();
}

class _HomeVerifyState extends State<HomeVerify> {
  bool isverifed = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    VerificationModel().sendverifcation();
    User? user = _auth.currentUser;
    isverifed = user != null ? user.emailVerified : false;
  }

  @override
  Widget build(BuildContext context) {
    return isverifed ? const Home() : VerificationScreen();
  }
}
