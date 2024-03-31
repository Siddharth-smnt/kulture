import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mandar_purushottam_s_application1/firebase_options.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/onboarding_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_screen/profile_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_container_screen/kitchen_container_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Other initialization code
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(
        ThemeState(
          themeType: PrefUtils().getThemeData(),
        ),
      ),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MultiProvider(
              providers: [
                Provider<FirebaseAuthMethods>(
                  create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
                ),
                StreamProvider(
                  create: (context) =>
                      context.read<FirebaseAuthMethods>().authState,
                  initialData: null,
                ),
              ],
              child: MaterialApp(
                theme: theme,
                title: 'Kulture',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale(
                    'en',
                    '',
                  ),
                ],
                // initialRoute: AppRoutes.initialRoute,
                home: const AuthWrapper(),
                routes: AppRoutes.routes,
              ));
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      Navigator.pushNamed(context, AppRoutes.kitchenContainerScreen);
    }
    return const OnBoardingScreen();
  }
}
