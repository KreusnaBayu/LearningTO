import 'package:flutter/material.dart';
import 'package:tryout/app/modules/register/controller/RegisterContoller.dart';
import 'package:tryout/utils/global.color.dart';
import 'package:tryout/app/components/button.global.dart';
import 'package:tryout/app/components/social.login.dart';
import 'package:tryout/app/components/text.form.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpController controller = SignUpController();

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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo2.png', // Replace with the actual path to your image
                    width: 150, // Adjust the width as needed
                    height: 150, // Adjust the height as needed
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextForm(
                  controller: controller.nameController,
                  text: 'Username',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Email Input
                TextForm(
                  controller: controller.emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Password Input
                TextForm(
                    controller: controller.passwordController,
                    textInputType: TextInputType.text,
                    obscure: false,
                    text: 'Password'),
                const SizedBox(
                  height: 10,
                ),
                ButtonGlobal(
                  info: 'Sign Up',
                  onPressed: () => controller.signup(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                SocialLogin(
                  Sign: '-Or sign up with',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
