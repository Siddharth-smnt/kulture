import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/EstimateModel.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/bloc/estimate_bloc.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';

class EstimatePage extends StatelessWidget {
  const EstimatePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EstimateBloc>(
      create: (context) =>
          EstimateBloc(EstimateState())..add(EstimateInitialEvent()),
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
                      child: BlocBuilder<EstimateBloc, EstimateState>(
                        buildWhen: (previous, current) => current != previous,
                        builder: (context, state) {
                          return _buildTable(state.estimateModelObj);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        20), // Add some spacing between the table and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _circleButton(
                      color: Colors.green,
                      symbol: Icons.add,
                      onPressed: () {
                        // Add your logic for plus button here
                      },
                    ),
                    SizedBox(width: 20), // Add some spacing between buttons
                    _circleButton(
                      color: Colors.red,
                      symbol: Icons.remove,
                      onPressed: () {
                        // Add your logic for minus button here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTable(List<EstimateModel>? state) {
    List<TableRow> rows = [];
    rows.add(_buildTableRow('Recipe Name', 'Person', 'Add', 'Remove',
        isHeader: true));
    if (state != null) {
      for (var item in state) {
        rows.add(
            _buildTableRow(item.recipeName!, item.people.toString(), '+', '-'));
      }
    }
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1.85), // Adjust the width of the columns as needed
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      border: TableBorder.all(),
      children: rows,
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

  // Define CircleButton widget here
  Widget _circleButton({
    required Color color,
    required IconData symbol,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: color, width: 4), // Increase border width for bold circle
        ),
        child: Center(
          child: Icon(
            symbol,
            color: color,
            size: 24, // Increase size of the icon to make it appear bolder
          ),
        ),
      ),
    );
  }
}
