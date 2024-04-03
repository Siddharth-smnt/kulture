import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_page/login_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_page/signup_screen.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';
import 'package:mandar_purushottam_s_application1/widgets/base_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static String routeName = '/onboarding_screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BaseButton(
                onTap: () {
                  Navigator.pushNamed(context, SignupScreen().routeName);
                },
                text: 'Email/Password Sign Up',
                buttonTextStyle: TextStyle(color: Colors.white),),
            BaseButton(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen().routeName);
              },
              text: 'Email/Password Login',
              buttonTextStyle: TextStyle(color: Colors.white),
            ),
            BaseButton(
              onTap: () async {
                AuthServices _auth = AuthServices();
                await _auth.signInAnon();
              },
              text: 'Anonymous Sign In',
              buttonTextStyle: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}