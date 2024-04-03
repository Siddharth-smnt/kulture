import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_page/onboarding_screen.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCxgWLQAwUH85ocYwdeWPCv7eodvISOFZM",
          appId: "1:334536738299:android:63cb49577f44075837375e",
          messagingSenderId: "334536738299",
          projectId: "kulture-7f415"));

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
          return MaterialApp(
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
            initialRoute: AppRoutes.initialRoute,
            home: const AuthWrapper(),
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthServices().user.listen((user) {
      if (user != null) {
      Navigator.pushNamed(context, AppRoutes.kitchenContainerScreen);
    }
    });
    return OnBoardingScreen();
  }
}