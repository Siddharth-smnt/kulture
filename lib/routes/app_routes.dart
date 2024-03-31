import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/email_Password_login_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/email_password_signup_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/onboarding_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/profile_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_container_screen/kitchen_container_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_one_screen/estimate_one_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String kitchenPage = '/kitchen_page';

  static const String kitchenContainerScreen = '/kitchen_container_screen';

  static const String recipesPage = '/recipes_page';

  static const String sabudanaKhichdiScreen = '/sabudana_khichdi_screen';

  static const String profilePage = '/profile_page';

  static const String plannerPage = '/planner_page';

  static const String estimatePage = '/estimate_page';

  static const String estimateOneScreen = '/estimate_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String emailPasswordSignup = '/email_password_signup_screen';

  static const String emailPasswordLogin = '/email_password_login_screen';

  static const String onboarding_screen = '/onboarding_screen';

  static Map<String, WidgetBuilder> get routes => {
        kitchenContainerScreen: KitchenContainerScreen.builder,
        estimateOneScreen: EstimateOneScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: (context) => OnBoardingScreen(),
        emailPasswordSignup: (context) => EmailPasswordSignup(),
        emailPasswordLogin: (context) => EmailPasswordLogin(),
        profilePage: (context) => ProfilePage(),
        onboarding_screen: (context) => OnBoardingScreen(),
      };
}


// EmailPasswordSignup.routeName: (context) => const EmailPasswordSignup(),
// EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
