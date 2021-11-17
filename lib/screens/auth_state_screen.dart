import 'package:flutter/material.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'customer_screen.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser?>(context);

    if (currentUser == null) {
      return WelcomeScreen();
    } else {
      return CustomerScreen();
    }
  }
}
