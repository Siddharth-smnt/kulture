import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/widgets/custom_button.dart';
import 'package:mandar_purushottam_s_application1/presentation/services/firebase_auth_methods.dart';
import 'package:mandar_purushottam_s_application1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // when user signs anonymously or with phone, there is no email
          if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(user.providerData[0].providerId),
          // display phone number only when user's phone number is not null
          if (user.phoneNumber != null) Text(user.phoneNumber!),
          // uid is always available for every sign in method
          Text(user.uid),
          // display the button only when the user email is not verified
          // or isnt an anonymous user
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
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().signOut(context);
              Navigator.pushNamed(context, AppRoutes.onboarding_screen);
            },
            text: 'Sign Out',
            textStyles: TextStyle(color: Colors.white),
          ),
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
    );
  }
}
