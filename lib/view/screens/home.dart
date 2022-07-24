import 'package:flutter/material.dart';

import '../../viewmodel/authenticationView/authenticaton.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Authenticaton().signout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(child: Text("Login successful")),
    );
  }
}
