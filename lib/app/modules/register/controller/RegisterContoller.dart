import 'dart:convert';
import 'package:tryout/auth/api.services.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup(BuildContext context) async {
    try {
      // Get user input
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      // Call the signup API endpoint
      await ApiService.signup(name, email, password);

      // Show success popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Signup Successful"),
            content: Text("You have successfully signed up."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate to the login screen on successful signup
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (error) {
      // Show error popup with the specific error message from API
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Signup Failed"),
            content: Text("Signup failed. ${getErrorMessages(error)}"),
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

      // Handle errors (you may want to log the error or perform additional actions)
      print('Signup failed: $error');
    }
  }

  String getErrorMessages(error) {
    if (error is Exception) {
      // Parse and format error messages from API
      try {
        Map<String, dynamic> errorData = jsonDecode(error.toString());
        if (errorData.containsKey('messages')) {
          Map<String, dynamic> messages = errorData['messages'];
          String errorMessage = '';
          messages.forEach((field, fieldErrors) {
            errorMessage += '$field: ${fieldErrors[0]}\n';
          });
          return errorMessage;
        }
      } catch (e) {
        // Handle JSON parsing error
      }
    }
    return 'An unknown error occurred.';
  }
}
