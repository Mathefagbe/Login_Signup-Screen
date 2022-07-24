import 'package:brancher_chatapp/model/enums/enums.dart';
import 'package:brancher_chatapp/view/widget/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticaton extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  LoadingOverlay loadingOverlay = LoadingOverlay();
  String errormessage = "";

  AppState appState = AppState.initial;

  Authenticaton() {
    userstate();
  }

//checking user state
  void userstate() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        appState = AppState.logout;
        notifyListeners();
      } else {
        appState = AppState.login;
        notifyListeners();
      }
    });
  }

//signup user
  Future registeruser(
      String name, String email, String password, BuildContext context) async {
    try {
      loadingOverlay.show(context);
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.updatePhotoURL(
          "https://th.bing.com/th/id/OIP.VFIzUeqHX3MW3UnguofCXAHaHa?pid=ImgDet&rs=1");
      loadingOverlay.hide();
    } on FirebaseException catch (e) {
      errormessage = e.code.toString();
      snack(context);
    } catch (e) {
      errormessage = e.toString();
      snack(context);
    }
    loadingOverlay.hide();
  }

//sign in user
  Future signinuser(String email, String password, BuildContext context) async {
    try {
      loadingOverlay.show(context);
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user!.emailVerified) {
        loadingOverlay.hide();
      }
      loadingOverlay.hide();
      return user.uid;
    } on FirebaseException catch (e) {
      errormessage = e.code.toString();
      snack(context);
    } catch (e) {
      errormessage = e.toString();
      snack(context);
    }
    loadingOverlay.hide();
  }

//logout user
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snack(context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        duration: const Duration(seconds: 3),
        content: Text(
          errormessage,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )));
  }
}
