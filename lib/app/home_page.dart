import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class HomePage extends StatelessWidget {
  final AuthBase auth;
  final VoidCallback onSignOut;

  const HomePage({
    Key key,
    @required this.auth,
    @required this.onSignOut,
  }) : super(key: key);

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 96,
        centerTitle: false,
        titleSpacing: 24,
        backgroundColor: Colors.white,
        title: Text(
          'Home page',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _signOut,
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
