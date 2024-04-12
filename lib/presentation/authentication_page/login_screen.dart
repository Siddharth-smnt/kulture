import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_page/util/custom_textfield.dart';
import 'package:mandar_purushottam_s_application1/routes/app_routes.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';

class LoginScreen extends StatefulWidget {
  final String routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                AuthServices _auth = AuthServices();
                final result = await _auth.login(
                    emailController.text, passwordController.text);
                Navigator.pushReplacementNamed(
                    context, AppRoutes.kitchenContainerScreen);
                if (result.toString().contains("invalid-credential")) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Wrong email/password"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFF6B00),
                textStyle: const TextStyle(color: Colors.white),
                minimumSize: Size(
                  MediaQuery.of(context).size.width / 2.5,
                  50,
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
