import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/widgets/custom_textfield.dart';
import 'package:mandar_purushottam_s_application1/presentation/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class EmailPasswordLogin extends StatefulWidget {
  final String routeName = '/email_password_login_screen';
  const EmailPasswordLogin({Key? key}) : super(key: key);

  @override
  _EmailPasswordLoginState createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700], // Set the background color here
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
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
              onPressed: loginUser,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFCC5602), // Set the button color here
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
