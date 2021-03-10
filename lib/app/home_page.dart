import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    final auth = AuthProvider.of(context);

    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      defaultActionText: 'OK',
      cancelActionText: 'Cancel',
    );

    if (didRequestSignOut == true) {
      _signOut(context);
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
            onPressed: () => _confirmSignOut(context),
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
