import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_page/login_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_page/signup_screen.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';

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
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignupScreen().routeName);
                },
                child: Text('Email/Password Sign Up', style: TextStyle(color: Colors.white),),
                ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen().routeName);
              },
              child: Text('Email/Password Login', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () async {
                AuthServices _auth = AuthServices();
                await _auth.signInAnon();
              },
              child: Text('Anonymous Sign In', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}