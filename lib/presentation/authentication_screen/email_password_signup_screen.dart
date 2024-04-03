import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/widgets/custom_textfield.dart';
import 'package:mandar_purushottam_s_application1/presentation/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class EmailPasswordSignup extends StatefulWidget {
  final String routeName = '/email_password_signup_screen';
  const EmailPasswordSignup({Key? key}) : super(key: key);

  @override
  _EmailPasswordSignupState createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<EmailPasswordSignup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700], // Set the background color here
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
            ),
            SizedBox(height: 20.0),
            CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: signUpUser,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFCC5602), // Set the button color here
                textStyle:
                    TextStyle(color: Colors.white), // Set text color to white
                minimumSize: Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
              child: Text(
                "Sign Up",
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
