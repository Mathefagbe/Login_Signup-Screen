import 'package:brancher_chatapp/model/route.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/logout_login.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/signinscreen.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/signupscreen.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/verification.dart';
import 'package:brancher_chatapp/view/screens/authenticationscreen/welcome.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/authenticaton.dart';
import 'package:brancher_chatapp/viewmodel/authenticationView/signin_signupview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC0pAQtsMKlZfpav4pvRGkOHAKzyYzwOlo",
          appId: "1:240041983071:web:ffb9b2de1280484892efea",
          messagingSenderId: "240041983071",
          projectId: "brancher-chatapp"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpSignInView()),
        ChangeNotifierProvider(create: (context) => Authenticaton()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Welcome(),
          initialRoute: "/",
          routes: RouterScreen.routescreen()),
    );
  }
}
