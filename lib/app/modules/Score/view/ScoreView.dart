import 'package:flutter/material.dart';
import 'package:tryout/app/modules/Quiz/controller/QuizController.dart';
import 'package:tryout/app/modules/Score/controller/ScoreController.dart';
import 'package:tryout/utils/global.color.dart';


class ResultsPage extends StatelessWidget {
  final ResultsController controller;

  ResultsPage({required int totalScore, required QuizController controller}) 
    : controller = ResultsController(totalScore: totalScore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/piala2.png',
              width: 400,
              height: 300,
            ),
            SizedBox(height: 16.0),
            Text(
              'Congratulations!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your total score is: ${controller.totalScore * 4}/100',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => controller.handleLogout(context),  // Panggil fungsi logout dari controller
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.redAccent[700],
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
