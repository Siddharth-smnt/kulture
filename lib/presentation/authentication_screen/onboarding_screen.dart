import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/email_Password_login_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/email_password_signup_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/widgets/custom_button.dart';
import 'package:mandar_purushottam_s_application1/presentation/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static String routeName = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(
                        context, EmailPasswordSignup().routeName);
                  },
                  text: 'Sign Up with Email/Password',
                  buttonColor: theme.primaryColor,
                  textStyles: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(
                        context, EmailPasswordLogin().routeName);
                  },
                  text: 'Login with Email/Password',
                  buttonColor: theme.primaryColor,
                  textStyles: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  onTap: () {
                    context
                        .read<FirebaseAuthMethods>()
                        .signInAnonymously(context);
                  },
                  text: 'Continue as Guest',
                  buttonColor: Colors.grey[400]!,
                  textStyles: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
