import 'package:Airplay/models/user_model.dart';
import 'package:Airplay/services/auth_service.dart';
import 'package:Airplay/ui/auth/login.dart';
import 'package:Airplay/ui/dashboard/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// HOME SCREEN OR LOGIN SCREEN BASED ON AUTH STATUS

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? Login() : NavBar();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
