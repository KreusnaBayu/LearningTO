import 'package:flutter/material.dart';
import 'package:tryout/app/modules/Quiz/view/QuizView.dart';
import '../../../../auth/api.services.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    try {
      String username = emailController.text;
      String password = passwordController.text;

      bool loginSuccess = await ApiLogin.login(username, password);

      if (loginSuccess) {
        _showDialog(context, "Login Successful", "You have successfully logged in.");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizPage()),
        );
      } else {
        _showDialog(context, "Login Failed", "Login failed. Please check your credentials.");
      }
    } catch (error) {
      print('Login failed: $error');
    }
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}