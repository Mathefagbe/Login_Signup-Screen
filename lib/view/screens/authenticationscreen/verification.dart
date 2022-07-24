import 'package:brancher_chatapp/view/widget/customclip.dart';
import 'package:brancher_chatapp/view/widget/resuablebotton.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/authenticaton.dart';
import 'package:flutter/material.dart';

import '../../constant/fonts/fonts.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);
  final Font _font = Font();

  @override
  Widget build(BuildContext context) {
    var height = _font.height(context);
    var text = _font.textfont(context);
    var width = _font.width(context);
    return Scaffold(
        body: Column(
      children: [
        buildstack(context),
        SizedBox(
          height: height * 0.082,
        ),
        Text(
          "Check Your email!",
          style: TextStyle(fontSize: text * 0.027, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: height * 0.041,
        ),
        Text(
          "we have sent a verification email to",
          style: TextStyle(fontSize: text * 0.025, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: height * 0.007,
        ),
        Text(
          "your email address.Click and follow the",
          style: TextStyle(fontSize: text * 0.025, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: height * 0.007,
        ),
        Text(
          "link inside it",
          style: TextStyle(fontSize: text * 0.025, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: height * 0.068,
        ),
        ResuableButton(
          ontap: () async {
            await Authenticaton().signout();
          },
          text: "Cancel",
          color: const Color.fromARGB(255, 243, 33, 194),
          textcolor: Colors.white,
          bordercolor: Colors.white,
          gradient: const LinearGradient(colors: [Colors.purple, Colors.red]),
        )
        //const CancelButton()
      ],
    ));
  }

  Widget buildstack(BuildContext context) {
    var height = _font.height(context);
    var text = _font.textfont(context);
    var width = _font.width(context);
    return SizedBox(
      height: height * 0.34,
      width: double.maxFinite,
      child: Stack(children: [
        ClipPath(
          clipper: VerifcationClips(),
          child: Container(
            height: height * 0.272,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.purple, Colors.red])),
          ),
        ),
        Positioned(
          left: width * 0.3611,
          right: width * 0.3611,
          top: height * 0.20,
          child: const CircleAvatar(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/email.jpg"),
              ),
              radius: 50,
              backgroundColor: Colors.white),
        )
      ]),
    );
  }
}
