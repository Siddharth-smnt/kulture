import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/bloc/planner_bloc.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/models/planner_model.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';

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
                    // CustomOutlinedButton(
                    //   height: 46.0,
                    //   text: "lbl_save".tr,
                    //   buttonStyle: CustomButtonStyles.outlinePrimaryTL8,
                    //   buttonTextStyle: CustomTextStyles.bodyMediumLato,
                    //   onPressed: () {
                    //     // Handle save action here
                    //   },
                    // ),
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
        _buildTableRow(
          _buildTableHeader("Date"),
          _buildTableHeader("Event"),
          _buildTableHeader("Menu"),
          isHeader: true,
        ),
        _buildTableRow(
          TextFormField(initialValue: "msg_sunday_august_27".tr),
          TextFormField(initialValue: "msg_shravana_putrada".tr),
          TextFormField(initialValue: "msg_batata_vada_chatni".tr),
        ),
        _buildTableRow(
          TextFormField(initialValue: "msg_tuesday_august".tr),
          TextFormField(initialValue: "lbl_onam_thiruvonam".tr),
          TextFormField(initialValue: "lbl_pav_bhaji".tr),
        ),
        _buildTableRow(
          TextFormField(initialValue: "msg_wednesday_august".tr),
          TextFormField(initialValue: "lbl_raksha_bandhan".tr),
          TextFormField(initialValue: "lbl_idli_sambar".tr),
        ),
        _buildTableRow(
          TextFormField(initialValue: "Monday, august 24"),
          TextFormField(initialValue: "diwali"),
          TextFormField(initialValue: "Shankarpali"),
        ),
        _buildTableRow(
          TextFormField(initialValue: "Thursday, august 15"),
          TextFormField(initialValue: "gudhipadwa"),
          TextFormField(initialValue: "Puran Poli"),
        ),
        _buildTableRow(
          TextFormField(initialValue: "Friday, august 15"),
          TextFormField(initialValue: "dasra"),
          TextFormField(initialValue: "Chole Bhature"),
        ),
        _buildTableRow(
          TextFormField(initialValue: "Saturday, august 15"),
          TextFormField(initialValue: "vijayadashmi"),
          TextFormField(initialValue: "Curd Rice"),
        ),
      ],
    );
  }

  TableRow _buildTableRow(Widget column1, Widget column2, Widget column3,
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

  Widget _buildTableCell(Widget child, {bool isHeader = false}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isHeader
            ? Center(child: child)
            : TextFormField(
                initialValue: (child as TextFormField).initialValue,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {},
              ),
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
