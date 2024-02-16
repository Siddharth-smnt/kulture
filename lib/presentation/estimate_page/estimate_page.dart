import 'bloc/estimate_bloc.dart';
import 'models/estimate_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_outlined_button.dart';

class EstimatePage extends StatelessWidget {
  const EstimatePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EstimateBloc>(
        create: (context) =>
            EstimateBloc(EstimateState(estimateModelObj: EstimateModel()))
              ..add(EstimateInitialEvent()),
        child: EstimatePage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<EstimateBloc, EstimateState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.fillWhiteA,
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
                    SizedBox(height: 2.v),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 5.v),
                                child: Column(children: [
                                  Container(
                                      width: double.maxFinite,
                                      decoration: AppDecoration.outlinePrimary1,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 11.v),
                                            SizedBox(
                                                height: 268.v,
                                                width: 345.h,
                                                child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          13.v),
                                                              child: Text(
                                                                  "lbl_planner2"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .headlineSmall))),
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 10
                                                                                  .h,
                                                                              vertical: 16
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer1,
                                                                          child: Text(
                                                                              "lbl_ingridints".tr,
                                                                              style: CustomTextStyles.titleSmallInterWhiteA700)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 16
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer1,
                                                                          child: Text(
                                                                              "lbl_qty".tr,
                                                                              style: CustomTextStyles.titleSmallInterWhiteA700)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 17
                                                                                  .v),
                                                                          decoration: AppDecoration.fillOrange.copyWith(
                                                                              borderRadius: BorderRadiusStyle
                                                                                  .customBorderLR16),
                                                                          child: Text(
                                                                              "lbl_price".tr,
                                                                              style: CustomTextStyles.titleSmallInterWhiteA700))
                                                                    ]),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 28
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer2,
                                                                          child: Text(
                                                                              "lbl_rice".tr,
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 27
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer3,
                                                                          child: Text(
                                                                              "lbl_5_kg".tr,
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 28
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer3,
                                                                          child: Text(
                                                                              "lbl_200rs".tr,
                                                                              style: theme.textTheme.labelLarge))
                                                                    ]),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 19
                                                                                  .h,
                                                                              vertical: 27
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer2,
                                                                          child: Text(
                                                                              "lbl_mug_dal".tr,
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 27
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer3,
                                                                          child: Text(
                                                                              "lbl_500_gm".tr,
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 28
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer3,
                                                                          child: Text(
                                                                              "lbl_95rs".tr,
                                                                              style: theme.textTheme.labelLarge))
                                                                    ]),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 14
                                                                                  .h,
                                                                              vertical: 22
                                                                                  .v
                                                                                  ),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer2,
                                                                          child: Text(
                                                                              "lbl_kothimbir".tr,
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 22
                                                                                  .v
                                                                                  ),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer3,
                                                                          child: Text(
                                                                              "lbl_1_bndl".tr,
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 30
                                                                                  .h,
                                                                              vertical: 22
                                                                                  .v),
                                                                          decoration: AppDecoration
                                                                              .outlineOnPrimaryContainer3,
                                                                          child: Text(
                                                                              "lbl_20rs".tr,
                                                                              style: theme.textTheme.labelLarge))
                                                                    ])
                                                              ]))
                                                    ])),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 24.h),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      24.h,
                                                                  vertical:
                                                                      28.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer2,
                                                          child: Text(
                                                              "lbl_mirchi".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge)),
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.h,
                                                                  vertical:
                                                                      27.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer3,
                                                          child: Text(
                                                              "lbl_100_gm2".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge)),
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.h,
                                                                  vertical:
                                                                      28.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer3,
                                                          child: Text(
                                                              "lbl_20rs".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge))
                                                    ])),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 24.h),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      25.h,
                                                                  vertical:
                                                                      28.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer2,
                                                          child: Text(
                                                              "lbl_adrak".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge)),
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.h,
                                                                  vertical:
                                                                      27.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer3,
                                                          child: Text(
                                                              "lbl_100_gm2".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge)),
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.h,
                                                                  vertical:
                                                                      28.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer3,
                                                          child: Text(
                                                              "lbl_20rs".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge))
                                                    ])),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 24.h),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.h,
                                                                  vertical:
                                                                      28.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer2,
                                                          child: Text(
                                                              "lbl_oil".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge)),
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.h,
                                                                  vertical:
                                                                      28.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer3,
                                                          child: Text(
                                                              "lbl_1_ltr".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge)),
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.h,
                                                                  vertical:
                                                                      28.v),
                                                          decoration: AppDecoration
                                                              .outlineOnPrimaryContainer3,
                                                          child: Text(
                                                              "lbl_180rs".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge))
                                                    ])),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 24.h),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2.h,
                                                                      vertical:
                                                                          27.v),
                                                              decoration:
                                                                  AppDecoration
                                                                      .outlineOnPrimaryContainer2,
                                                              child: Text(
                                                                  "lbl_for_20_people"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelLarge)),
                                                          Container(
                                                              height: 72.v,
                                                              width: 154.h,
                                                              decoration: BoxDecoration(
                                                                  border: Border(
                                                                      bottom: BorderSide(
                                                                          color: theme
                                                                              .colorScheme
                                                                              .onPrimaryContainer,
                                                                          width: 1
                                                                              .h),
                                                                      right: BorderSide(
                                                                          color: theme
                                                                              .colorScheme
                                                                              .onPrimaryContainer,
                                                                          width:
                                                                              1.h)))),
                                                          CustomOutlinedButton(
                                                              height: 72.v,
                                                              width: 106.h,
                                                              text:
                                                                  "lbl_total_535rs"
                                                                      .tr,
                                                              buttonTextStyle: theme
                                                                  .textTheme
                                                                  .labelLarge!),
                                                          Container(
                                                              height: 72.v,
                                                              width: 23.h,
                                                              decoration: BoxDecoration(
                                                                  border: Border(
                                                                      bottom: BorderSide(
                                                                          color: theme
                                                                              .colorScheme
                                                                              .onPrimaryContainer,
                                                                          width: 1
                                                                              .h),
                                                                      right: BorderSide(
                                                                          color: theme
                                                                              .colorScheme
                                                                              .onPrimaryContainer,
                                                                          width:
                                                                              1.h))))
                                                        ])))
                                          ])),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.h, top: 30.v, right: 32.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomOutlinedButton(
                                                width: 82.h,
                                                text: "lbl_share".tr,
                                                margin: EdgeInsets.only(
                                                    bottom: 4.v),
                                                buttonStyle: CustomButtonStyles
                                                    .outlinePrimaryTL81,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .bodyMediumLato,
                                                onTap: () {
                                                  onTapShare(context);
                                                }),
                                            CustomOutlinedButton(
                                                width: 82.h,
                                                text: "lbl_delete".tr,
                                                margin:
                                                    EdgeInsets.only(top: 4.v),
                                                buttonStyle: CustomButtonStyles
                                                    .outlinePrimaryTL82,
                                                buttonTextStyle: CustomTextStyles
                                                    .titleSmallLatoWhiteA700)
                                          ]))
                                ]))))
                  ]))));
    });
  }

  /// Navigates to the estimateOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the estimateOneScreen.
  onTapShare(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.estimateOneScreen,
    );
  }
}
