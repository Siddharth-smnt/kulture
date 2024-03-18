import 'bloc/planner_bloc.dart';
import 'models/planner_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_outlined_button.dart';

class PlannerPage extends StatelessWidget {
  const PlannerPage({Key? key}) : super(key: key);

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
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            decoration:
                                AppDecoration.outlineOnPrimaryContainer1,
                            child: Text(
                              "lbl_date".tr,
                              style: CustomTextStyles.titleSmallWhiteA700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            decoration:
                                AppDecoration.outlineOnPrimaryContainer1,
                            child: Text(
                              "lbl_event".tr,
                              style: CustomTextStyles.titleSmallWhiteA700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            decoration: AppDecoration.fillOrange.copyWith(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              "lbl_menu".tr,
                              style: CustomTextStyles.titleSmallWhiteA700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            decoration:
                                AppDecoration.outlineOnPrimaryContainer2,
                            child: Text(
                              "msg_sunday_august_27".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .labelLargeFigtreeBluegray900
                                  .copyWith(height: 1.25),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomOutlinedButton(
                            height: 72.0,
                            text: "msg_shravana_putrada".tr,
                            buttonTextStyle:
                                CustomTextStyles.labelLargeFigtreeOnPrimary,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomOutlinedButton(
                            height: 72.0,
                            text: "msg_batata_vada_chatni".tr,
                            buttonTextStyle:
                                CustomTextStyles.labelLargeFigtreeOnPrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            decoration:
                                AppDecoration.outlineOnPrimaryContainer2,
                            child: Text(
                              "msg_tuesday_august".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .labelLargeFigtreeBluegray900
                                  .copyWith(height: 1.25),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomOutlinedButton(
                            height: 72.0,
                            text: "lbl_onam_thiruvonam".tr,
                            buttonTextStyle:
                                CustomTextStyles.labelLargeFigtreeOnPrimary,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomOutlinedButton(
                            height: 72.0,
                            text: "lbl_pav_bhaji".tr,
                            buttonTextStyle:
                                CustomTextStyles.labelLargeFigtreeOnPrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            decoration:
                                AppDecoration.outlineOnPrimaryContainer2,
                            child: Text(
                              "msg_wednesday_august".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .labelLargeFigtreeBluegray900
                                  .copyWith(height: 1.25),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomOutlinedButton(
                            height: 72.0,
                            text: "lbl_raksha_bandhan".tr,
                            buttonTextStyle:
                                CustomTextStyles.labelLargeFigtreeOnPrimary,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomOutlinedButton(
                            height: 72.0,
                            text: "lbl_idli_sambar".tr,
                            buttonTextStyle:
                                CustomTextStyles.labelLargeFigtreeOnPrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_planner2".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    CustomOutlinedButton(
                      height: 46.0,
                      text: "lbl_save".tr,
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL8,
                      buttonTextStyle: CustomTextStyles.bodyMediumLato,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
