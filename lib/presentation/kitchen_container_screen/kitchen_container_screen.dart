import 'package:mandar_purushottam_s_application1/presentation/authentication_page/profile_page.dart';

import 'bloc/kitchen_container_bloc.dart';
import 'models/kitchen_container_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/estimate_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/kitchen_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/planner_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/recipes_page.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class KitchenContainerScreen extends StatelessWidget {
  KitchenContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<KitchenContainerBloc>(
        create: (context) => KitchenContainerBloc(KitchenContainerState(
            kitchenContainerModelObj: KitchenContainerModel()))
          ..add(KitchenContainerInitialEvent()),
        child: KitchenContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<KitchenContainerBloc, KitchenContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.kitchenPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar:
                  CustomBottomBar(onChanged: (BottomBarEnum type) {
                Navigator.pushNamed(
                    navigatorKey.currentContext!, getCurrentRoute(type));
              })));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Kitchen:
        return AppRoutes.kitchenPage;
      case BottomBarEnum.Recipes:
        return AppRoutes.recipesPage;
      case BottomBarEnum.Planner:
        return AppRoutes.plannerPage;
      case BottomBarEnum.Estimate:
        return AppRoutes.estimatePage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.kitchenPage:
        return KitchenPage.builder(context);
      case AppRoutes.recipesPage:
        return RecipesPage.builder(context);
      case AppRoutes.plannerPage:
        return PlannerPage.builder(context);
      case AppRoutes.estimatePage:
        return EstimatePage.builder(context);
      case AppRoutes.profilePage: 
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
