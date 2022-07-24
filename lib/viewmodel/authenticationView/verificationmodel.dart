import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class VerificationModel extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Timer? timer;

  //send verification message to user
  Future sendverifcation() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      timer = Timer.periodic(
          const Duration(seconds: 10), (timer) => checkverification());
    }
  }

  //checking if the user has verified or not
  Future checkverification() async {
    User? user = _firebaseAuth.currentUser;
    //reload the user to know if he has verified or not
    await user!.reload();
    // notifyListeners();
    if (user.emailVerified) {
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
