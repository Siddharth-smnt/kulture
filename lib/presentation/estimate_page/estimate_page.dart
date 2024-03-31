import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/bloc/estimate_bloc.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/models/estimate_model.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';

class EstimatePage extends StatelessWidget {
  const EstimatePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EstimateBloc>(
      create: (context) =>
          EstimateBloc(EstimateState(estimateModelObj: EstimateModel()))
            ..add(EstimateInitialEvent()),
      child: EstimatePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EstimateBloc, EstimateState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              children: [
                SizedBox(
                  height: 83.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomAppBar(
                        centerTitle: true,
                        title: AppbarTitle(text: "lbl_estimate2".tr),
                        styleType: Style.bgFill,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 14.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(color: appTheme.orangeA700),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: _buildTable(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTable() {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1.85), // Adjust the width of the columns as needed
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      border: TableBorder.all(),
      children: [
        _buildTableRow('Recipe Name', 'Person', 'Add', 'Remove',
            isHeader: true),
        _buildTableRow('Recipe 1', '2', '+', '-'), // Example data rows
        _buildTableRow('Recipe 2', '3', '+', '-'),
        // Add more rows as needed
      ],
    );
  }

  TableRow _buildTableRow(
      String recipeName, String person, String increase, String decrease,
      {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader ? BoxDecoration(color: appTheme.orangeA700) : null,
      children: [
        _buildTableCell(recipeName, isHeader: isHeader),
        _buildTableCell(person, isHeader: isHeader),
        _buildTableCell(increase, isHeader: isHeader),
        _buildTableCell(decrease, isHeader: isHeader),
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
            color: isHeader
                ? Color(Colors.white.value)
                : Color(Colors.black.value),
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
