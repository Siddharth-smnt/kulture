import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_container_screen/kitchen_container_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/sabudana_khichdi_screen/sabudana_khichdi_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_one_screen/estimate_one_screen.dart';
import 'package:mandar_purushottam_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String kitchenPage = '/kitchen_page';

  static const String kitchenContainerScreen = '/kitchen_container_screen';

  static const String recipesPage = '/recipes_page';

  static const String sabudanaKhichdiScreen = '/sabudana_khichdi_screen';

  static const String plannerPage = '/planner_page';

  static const String estimatePage = '/estimate_page';

  static const String estimateOneScreen = '/estimate_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        kitchenContainerScreen: KitchenContainerScreen.builder,
        sabudanaKhichdiScreen: SabudanaKhichdiScreen.builder,
        estimateOneScreen: EstimateOneScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: KitchenContainerScreen.builder
      };
}
