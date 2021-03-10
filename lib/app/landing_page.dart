import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);

    return StreamBuilder<User>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;

          if (user == null) {
            return SignInPage();
          }

          return HomePage();
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      stream: auth.authStateChanges(),
    );
  }
}
