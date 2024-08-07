
import 'package:flutter/material.dart';
import 'package:tryout/app/modules/Login/controller/LoginController.dart';
import 'package:tryout/app/modules/register/view/RegisterView.dart';

import 'package:tryout/utils/global.color.dart';

import '../../../components/button.global.dart';
import '../../../components/social.login.dart';
import '../../../components/text.form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo2.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Login to your account",
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                TextForm(
                  controller: loginController.emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextForm(
                  controller: loginController.passwordController,
                  textInputType: TextInputType.text,
                  obscure: true,
                  text: 'Password',
                ),
                const SizedBox(height: 10),
                ButtonGlobal(
                  info: 'Sign in',
                  onPressed: () => loginController.login(context),
                ),
                const SizedBox(height: 10),
                SocialLogin(Sign: '-Or sign in with'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account?'),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              child: Text(
                ' Sign Up',
                style: TextStyle(color: GlobalColors.mainColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
