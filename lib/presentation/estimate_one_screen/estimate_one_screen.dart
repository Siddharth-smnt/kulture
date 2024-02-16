import 'bloc/estimate_one_bloc.dart';
import 'models/estimate_one_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/estimate_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/kitchen_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/planner_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/recipes_page.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_bottom_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class EstimateOneScreen extends StatelessWidget {
  EstimateOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<EstimateOneBloc>(
        create: (context) => EstimateOneBloc(
            EstimateOneState(estimateOneModelObj: EstimateOneModel()))
          ..add(EstimateOneInitialEvent()),
        child: EstimateOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<EstimateOneBloc, EstimateOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(
                        height: 83.v,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          CustomAppBar(
                              centerTitle: true,
                              title: AppbarTitle(text: "lbl_estimate2".tr),
                              styleType: Style.bgFill),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  height: 14.v,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: appTheme.orangeA700)))
                        ])),
                    SizedBox(height: 13.v),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 19.h, right: 98.h, bottom: 5.v),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgArrowleft,
                                                height: 28.adaptSize,
                                                width: 28.adaptSize,
                                                margin: EdgeInsets.only(
                                                    bottom: 196.v),
                                                onTap: () {
                                                  onTapImgArrowleftone(context);
                                                }),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 14.v),
                                                child: Column(children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomOutlinedButton(
                                                            height: 52.v,
                                                            width: 86.h,
                                                            text:
                                                                "lbl_vegetables"
                                                                    .tr,
                                                            buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineOnPrimaryContainerTL16,
                                                            buttonTextStyle: theme
                                                                .textTheme
                                                                .bodyMedium!),
                                                        CustomOutlinedButton(
                                                            height: 52.v,
                                                            width: 107.h,
                                                            text: "lbl_qty2".tr,
                                                            buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineOnPrimaryContainer1,
                                                            buttonTextStyle:
                                                                theme.textTheme
                                                                    .bodyMedium!)
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomOutlinedButton(
                                                            height: 34.v,
                                                            width: 86.h,
                                                            text:
                                                                "lbl_lady_fingure"
                                                                    .tr,
                                                            buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineOnPrimaryContainer2),
                                                        CustomOutlinedButton(
                                                            height: 34.v,
                                                            width: 107.h,
                                                            text: "lbl_2_kg".tr)
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomOutlinedButton(
                                                            width: 86.h,
                                                            text:
                                                                "lbl_green_chilli"
                                                                    .tr,
                                                            buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineOnPrimaryContainer2),
                                                        CustomOutlinedButton(
                                                            width: 107.h,
                                                            text:
                                                                "lbl_500_gm".tr)
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomOutlinedButton(
                                                            height: 40.v,
                                                            width: 86.h,
                                                            text:
                                                                "lbl_coriander"
                                                                    .tr,
                                                            buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineOnPrimaryContainer2),
                                                        CustomOutlinedButton(
                                                            height: 40.v,
                                                            width: 107.h,
                                                            text:
                                                                "lbl_1_bnd".tr)
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomOutlinedButton(
                                                            width: 86.h,
                                                            text: "lbl_pumpkin"
                                                                .tr,
                                                            buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineOnPrimaryContainer2),
                                                        CustomOutlinedButton(
                                                            width: 107.h,
                                                            text: "lbl_2_kg".tr)
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomOutlinedButton(
                                                            width: 86.h,
                                                            text:
                                                                "lbl_tomato".tr,
                                                            buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineOnPrimaryContainer2),
                                                        CustomOutlinedButton(
                                                            width: 107.h,
                                                            text: "lbl_3_kg".tr)
                                                      ])
                                                ]))
                                          ]),
                                      CustomOutlinedButton(
                                          width: 82.h,
                                          text: "lbl_share".tr,
                                          margin: EdgeInsets.only(
                                              top: 23.v, right: 65.h),
                                          buttonStyle: CustomButtonStyles
                                              .outlinePrimaryTL81,
                                          buttonTextStyle:
                                              CustomTextStyles.bodyMediumLato),
                                      SizedBox(height: 58.v),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                height: 52.v,
                                                width: 86.h,
                                                text: "lbl_dairy".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainerTL16,
                                                buttonTextStyle: theme
                                                    .textTheme.bodyMedium!),
                                            CustomOutlinedButton(
                                                height: 52.v,
                                                width: 107.h,
                                                text: "lbl_qty2".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer1,
                                                buttonTextStyle:
                                                    theme.textTheme.bodyMedium!)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                height: 34.v,
                                                width: 86.h,
                                                text: "lbl_milk".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                height: 34.v,
                                                width: 107.h,
                                                text: "lbl_5_ltr".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 86.h,
                                                text: "lbl_curd".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                width: 107.h,
                                                text: "lbl_500_gm".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                height: 40.v,
                                                width: 86.h,
                                                text: "lbl_butter_milk".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                height: 40.v,
                                                width: 107.h,
                                                text: "lbl_2_ltr".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 86.h,
                                                text: "lbl_paneer".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                width: 107.h,
                                                text: "lbl_2_kg".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 86.h,
                                                text: "lbl_butter".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                width: 107.h,
                                                text: "lbl_500_gm".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 86.h,
                                                text: "lbl_ghee".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                width: 107.h,
                                                text: "lbl_500_gm".tr)
                                          ]),
                                      CustomOutlinedButton(
                                          width: 82.h,
                                          text: "lbl_share".tr,
                                          margin: EdgeInsets.only(
                                              top: 23.v, right: 57.h),
                                          buttonStyle: CustomButtonStyles
                                              .outlinePrimaryTL81,
                                          buttonTextStyle:
                                              CustomTextStyles.bodyMediumLato),
                                      SizedBox(height: 74.v),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                height: 52.v,
                                                width: 86.h,
                                                text: "lbl_grocerry".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainerTL16,
                                                buttonTextStyle: theme
                                                    .textTheme.bodyMedium!),
                                            CustomOutlinedButton(
                                                height: 52.v,
                                                width: 107.h,
                                                text: "lbl_qty2".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer1,
                                                buttonTextStyle:
                                                    theme.textTheme.bodyMedium!)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                height: 34.v,
                                                width: 86.h,
                                                text: "lbl_rice2".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                height: 34.v,
                                                width: 107.h,
                                                text: "lbl_5_kg".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 86.h,
                                                text: "lbl_tur_dal".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                width: 107.h,
                                                text: "lbl_500_gm".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.h,
                                                    vertical: 12.v),
                                                decoration: AppDecoration
                                                    .outlineOnPrimaryContainer2,
                                                child: Text(
                                                    "lbl_garam_masala".tr,
                                                    style: theme
                                                        .textTheme.bodySmall)),
                                            CustomOutlinedButton(
                                                height: 40.v,
                                                width: 107.h,
                                                text: "lbl_100_gm2".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 86.h,
                                                text: "lbl_oil".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                width: 107.h,
                                                text: "lbl_1_ltr".tr)
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 86.h,
                                                text: "lbl_jaggery".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineOnPrimaryContainer2),
                                            CustomOutlinedButton(
                                                width: 107.h,
                                                text: "lbl_3_kg".tr)
                                          ]),
                                      CustomOutlinedButton(
                                          width: 82.h,
                                          text: "lbl_share".tr,
                                          margin: EdgeInsets.only(
                                              top: 23.v, right: 57.h),
                                          buttonStyle: CustomButtonStyles
                                              .outlinePrimaryTL81,
                                          buttonTextStyle:
                                              CustomTextStyles.bodyMediumLato)
                                    ]))))
                  ])),
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
        return "/";
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
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapImgArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
