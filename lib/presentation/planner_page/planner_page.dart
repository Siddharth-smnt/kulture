import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/bloc/planner_bloc.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/models/planner_model.dart';
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
      child: const PlannerPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    _buildTable(),
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

  Widget _buildTable() {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      border: TableBorder.all(),
      children: [
        _buildTableRow("lbl_date".tr, "lbl_event".tr, "lbl_menu".tr,
            isHeader: true),
        _buildTableRow("msg_sunday_august_27".tr, "msg_shravana_putrada".tr,
            "msg_batata_vada_chatni".tr),
        _buildTableRow("msg_tuesday_august".tr, "lbl_onam_thiruvonam".tr,
            "lbl_pav_bhaji".tr),
        _buildTableRow("msg_wednesday_august".tr, "lbl_raksha_bandhan".tr,
            "lbl_idli_sambar".tr),
      ],
    );
  }

  TableRow _buildTableRow(String column1, String column2, String column3,
      {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader ? BoxDecoration(color: appTheme.orangeA700) : null,
      children: [
        _buildTableCell(column1, isHeader: isHeader),
        _buildTableCell(column2, isHeader: isHeader),
        _buildTableCell(column3, isHeader: isHeader),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: isHeader ? Colors.white : Colors.black,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
