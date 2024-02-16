import 'bloc/planner_bloc.dart';
import 'models/planner_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class PlannerPage extends StatelessWidget {
  const PlannerPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<PlannerBloc>(
      create: (context) => PlannerBloc(PlannerState(
        plannerModelObj: PlannerModel(),
      ))
        ..add(PlannerInitialEvent()),
      child: PlannerPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<PlannerBloc, PlannerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              centerTitle: true,
              title: AppbarSubtitle(
                text: "lbl_planner2".tr,
              ),
              styleType: Style.bgFill,
            ),
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(
                    children: [
                      Container(
                        height: 14.v,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: appTheme.orangeA700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.h,
                          top: 141.v,
                          right: 24.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25.h,
                                vertical: 17.v,
                              ),
                              decoration:
                                  AppDecoration.outlineOnPrimaryContainer1,
                              child: Text(
                                "lbl_date".tr,
                                style: CustomTextStyles.titleSmallWhiteA700,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.h,
                                vertical: 17.v,
                              ),
                              decoration:
                                  AppDecoration.outlineOnPrimaryContainer1,
                              child: Text(
                                "lbl_event".tr,
                                style: CustomTextStyles.titleSmallWhiteA700,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.h,
                                vertical: 17.v,
                              ),
                              decoration: AppDecoration.fillOrange.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderLR16,
                              ),
                              child: Text(
                                "lbl_menu".tr,
                                style: CustomTextStyles.titleSmallWhiteA700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 18.v,
                              ),
                              decoration:
                                  AppDecoration.outlineOnPrimaryContainer2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 3.v),
                                  SizedBox(
                                    width: 56.h,
                                    child: Text(
                                      "msg_sunday_august_27".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .labelLargeFigtreeBluegray900
                                          .copyWith(
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 20.v,
                              ),
                              decoration:
                                  AppDecoration.outlineOnPrimaryContainer3,
                              child: SizedBox(
                                width: 124.h,
                                child: Text(
                                  "msg_shravana_putrada".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .labelLargeFigtreeOnPrimary
                                      .copyWith(
                                    height: 1.25,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 20.v,
                              ),
                              decoration:
                                  AppDecoration.outlineOnPrimaryContainer3,
                              child: SizedBox(
                                width: 69.h,
                                child: Text(
                                  "msg_batata_vada_chatni".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .labelLargeFigtreeOnPrimary
                                      .copyWith(
                                    height: 1.25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 18.v,
                              ),
                              decoration:
                                  AppDecoration.outlineOnPrimaryContainer2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 3.v),
                                  SizedBox(
                                    width: 56.h,
                                    child: Text(
                                      "msg_tuesday_august".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .labelLargeFigtreeBluegray900
                                          .copyWith(
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomOutlinedButton(
                              height: 72.v,
                              width: 153.h,
                              text: "lbl_onam_thiruvonam".tr,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeFigtreeOnPrimary,
                            ),
                            CustomOutlinedButton(
                              height: 72.v,
                              width: 106.h,
                              text: "lbl_pav_bhaji".tr,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeFigtreeOnPrimary,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.h,
                                vertical: 18.v,
                              ),
                              decoration:
                                  AppDecoration.outlineOnPrimaryContainer2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 3.v),
                                  SizedBox(
                                    width: 67.h,
                                    child: Text(
                                      "msg_wednesday_august".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .labelLargeFigtreeBluegray900
                                          .copyWith(
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomOutlinedButton(
                              height: 72.v,
                              width: 153.h,
                              text: "lbl_raksha_bandhan".tr,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeFigtreeOnPrimary,
                            ),
                            CustomOutlinedButton(
                              height: 72.v,
                              width: 106.h,
                              text: "lbl_idli_sambar".tr,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeFigtreeOnPrimary,
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgRow4,
                        height: 72.v,
                        width: 345.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text(
                            "lbl_planner2".tr,
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      SizedBox(height: 134.v),
                      CustomOutlinedButton(
                        height: 46.v,
                        width: 211.h,
                        text: "lbl_save".tr,
                        buttonStyle: CustomButtonStyles.outlinePrimaryTL8,
                        buttonTextStyle: CustomTextStyles.bodyMediumLato,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
