import 'package:brancher_chatapp/view/constant/fonts/fonts.dart';
import 'package:brancher_chatapp/view/constant/resueabledeco.dart';

import 'package:brancher_chatapp/view/widget/designcontainer.dart';
import 'package:brancher_chatapp/view/widget/resuablebotton.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/authenticaton.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/authenticationView/signin_signupview.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController email;
  late TextEditingController password;
  final _formstate = GlobalKey<FormState>();
  Authenticaton authenticaton = Authenticaton();
  final Font _font = Font();

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DesignContainer(),
            buildcolum(),
            buildRow(context),
            TextButton(
              onPressed: () {},
              child: const Text("Forget password"),
            )
          ],
        ),
      ),
    );
  }

//the sign in details

  Widget buildcolum() {
    var height = _font.height(context);
    var text = _font.textfont(context);
    var width = _font.width(context);
    return Form(
      key: _formstate,
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sign in",
                style: TextStyle(
                    fontSize: text * 0.0545,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple)),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
                controller: email,
                validator: (val) => val!.isEmpty ? "Enter a vaild email" : null,
                decoration: resuableDecoration.copyWith(
                    hintText: "Email", labelText: "Email")),
            SizedBox(
              height: height * 0.041,
            ),
            TextFormField(
                controller: password,
                validator: (val) => val!.length < 6
                    ? "Enter a password more than 6 char"
                    : null,
                decoration: resuableDecoration.copyWith(
                    hintText: "password", labelText: "password")),
            SizedBox(
              height: height * 0.041,
            ),
            ResuableButton(
              ontap: () async {
                if (_formstate.currentState!.validate()) {
                  try {
                    await authenticaton.signinuser(
                        email.text.trim(), password.text.trim(), context);
                  } catch (e) {
                    print(e);
                  }
                }
              },
              text: "Sign In",
              color: const Color.fromARGB(255, 243, 33, 194),
              textcolor: Colors.white,
              bordercolor: Colors.white,
              gradient:
                  const LinearGradient(colors: [Colors.purple, Colors.red]),
            )
          ],
        ),
      ),
    );
  }
}

//move to sign up

Widget buildRow(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Dont have an account?"),
      TextButton(
          onPressed: () {
            Provider.of<SignUpSignInView>(context, listen: false).signUp();
          },
          child: const Text("Sign up"))
    ],
  );
}
