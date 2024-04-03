import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/widgets/custom_button.dart';
import 'package:mandar_purushottam_s_application1/presentation/services/firebase_auth_methods.dart';
import 'package:mandar_purushottam_s_application1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<FirebaseAuthMethods>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${user.email ?? user.phoneNumber}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'User ID:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              user.uid,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            if (!user.emailVerified && !user.isAnonymous)
              CustomButton(
                onTap: () {
                  context
                      .read<FirebaseAuthMethods>()
                      .sendEmailVerification(context);
                },
                text: 'Verify Email',
                textStyles: TextStyle(color: Colors.white),
              ),
            SizedBox(height: 16),
            CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().signOut(context);
                Navigator.pushNamed(context, AppRoutes.onboarding_screen);
              },
              text: 'Sign Out',
              textStyles: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().deleteAccount(context);
                Navigator.pushNamed(context, AppRoutes.onboarding_screen);
              },
              text: 'Delete Account',
              textStyles: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
