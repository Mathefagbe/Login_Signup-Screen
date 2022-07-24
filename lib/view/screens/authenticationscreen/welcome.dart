import 'package:brancher_chatapp/view/widget/customclip.dart';
import 'package:brancher_chatapp/view/widget/resuablebotton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/authenticationView/signin_signupview.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildstack(),
          const Spacer(
            flex: 1,
          ),
          const Text(
            "Let's connect and chat",
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          buildrow(context),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

Widget buildstack() {
  return Stack(children: [
    ClipPath(
      clipper: WelcomeClips(),
      child: Container(
        width: double.maxFinite,
        height: 450,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple, Colors.red]),
          image: DecorationImage(
              image: AssetImage(
                "assets/images/people.jpg",
              ),
              fit: BoxFit.cover,
              opacity: 0.4),
        ),
      ),
    ),
    const Positioned(
        top: 100,
        left: 30,
        child: Text(
          "Connect to your\nfriend with",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
        )),
    const Positioned(
        top: 150,
        left: 30,
        child: Text(
          "Brancher",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ))
  ]);
}

Widget buildrow(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ResuableButton(
          ontap: () {
            Navigator.pushNamed(context, "/signin-signout");
            Provider.of<SignUpSignInView>(context, listen: false).signIn();
          },
          text: "sign in",
          color: const Color.fromARGB(255, 243, 33, 194),
          textcolor: Colors.white,
          bordercolor: Colors.white,
          gradient: const LinearGradient(colors: [Colors.purple, Colors.red]),
        ),
        ResuableButton(
          ontap: () {
            Navigator.pushNamed(context, "/signin-signout");
            Provider.of<SignUpSignInView>(context, listen: false).signUp();
          },
          text: "sign up",
          color: Colors.white,
          textcolor: const Color.fromARGB(255, 243, 33, 194),
          bordercolor: const Color.fromARGB(255, 199, 192, 200),
        ),
      ],
    ),
  );
}
