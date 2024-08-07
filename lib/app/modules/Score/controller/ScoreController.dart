import 'package:flutter/material.dart';
import 'package:tryout/app/modules/Login/view/LoginView.dart';

import 'package:tryout/auth/api.services.dart';
import 'package:tryout/auth/logout.service.dart';

class ResultsController {
  final int totalScore;

  ResultsController({required this.totalScore});

  // Fungsi untuk melakukan logout
  Future<void> handleLogout(BuildContext context) async {
    String? authToken = ApiLogin.getAuthToken();
    if (authToken != null) {
      bool logoutSuccess = await ApiLogout.logout(authToken);

      if (logoutSuccess) {
        // Redirect ke halaman login atau lakukan tindakan lainnya setelah logout
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        // Tindakan jika logout gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Logout failed. Please try again.'),
          ),
        );
      }
    } else {
      print('No auth token found. Unable to logout.'); // Tindakan jika token tidak ditemukan
    }
  }
}
