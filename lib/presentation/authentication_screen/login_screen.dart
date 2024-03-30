import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/email_Password_login_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/email_password_signup_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/widgets/custom_button.dart';
import 'package:mandar_purushottam_s_application1/presentation/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static String routeName = '/onboarding-screen';

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
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordSignup().routeName);
              },
              text: 'Email/Password Sign Up',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordLogin().routeName);
              },
              text: 'Email/Password Login',
            ),
            CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().signInAnonymously(context);
              },
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
