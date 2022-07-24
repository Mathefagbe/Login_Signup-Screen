import 'package:brancher_chatapp/view/constant/resueabledeco.dart';
import 'package:brancher_chatapp/view/widget/designcontainer.dart';
import 'package:brancher_chatapp/view/widget/resuablebotton.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/authenticaton.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/authenticationView/signin_signupview.dart';
import '../../constant/fonts/fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUPState();
}

class _SignUPState extends State<SignUp> {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;
  late TextEditingController fullname;
  final _formstate = GlobalKey<FormState>();
  Authenticaton authenticaton = Authenticaton();

  final Font _font = Font();
  @override
  void initState() {
    super.initState();
    fullname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    fullname.dispose();
    password.dispose();
    confirmpassword.dispose();
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
          ],
        ),
      ),
    );
  }

//the sign up details
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
            Text("Sign Up",
                style: TextStyle(
                    fontSize: text * 0.0545,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple)),
            SizedBox(
              height: height * 0.027,
            ),
            TextFormField(
                controller: fullname,
                validator: (val) => val!.isEmpty ? "Enter your fullname" : null,
                decoration: resuableDecoration.copyWith(
                    hintText: "Full name", labelText: "Full name")),
            SizedBox(
              height: height * 0.014,
            ),
            TextFormField(
                controller: email,
                validator: (val) => val!.isEmpty ? "Enter a vaild email" : null,
                decoration: resuableDecoration.copyWith(
                    hintText: "Email", labelText: "Email")),
            SizedBox(
              height: height * 0.014,
            ),
            TextFormField(
                controller: password,
                validator: (val) => val!.length < 6
                    ? "Enter a password more than 6 char"
                    : null,
                decoration: resuableDecoration.copyWith(
                    hintText: "password", labelText: "password")),
            SizedBox(
              height: height * 0.014,
            ),
            TextFormField(
                controller: confirmpassword,
                validator: (val) => val!.length < 6
                    ? "Enter a password more than 6 char"
                    : null,
                decoration: resuableDecoration.copyWith(
                    hintText: "Confirm password",
                    labelText: "Confirm password")),
            SizedBox(
              height: height * 0.027,
            ),
            ResuableButton(
              ontap: () async {
                if (_formstate.currentState!.validate() &&
                    password.text == confirmpassword.text) {
                  try {
                    await authenticaton.registeruser(fullname.text.trim(),
                        email.text.trim(), password.text.trim(), context);
                  } catch (e) {
                    print(e);
                  }
                }
              },
              text: "Sign Up",
              color: Color.fromARGB(255, 243, 33, 194),
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

//move to sign up

}

Widget buildRow(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Already have an account?"),
      TextButton(
          onPressed: () {
            Provider.of<SignUpSignInView>(context, listen: false).signIn();
          },
          child: const Text("Sign In"))
    ],
  );
}
