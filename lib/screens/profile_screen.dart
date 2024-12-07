import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 141, 141), // .fromARGB(255, 35, 47, 59),

      body: Center(
        child: Text("profil ekranim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}