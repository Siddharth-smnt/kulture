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
                        id: "toaddId",
                        add: true
                    ),
                    SizedBox(width: 20), // Add some spacing between buttons
                    _circleButton(
                      color: Colors.red,
                      symbol: Icons.remove,
                        id: "toremoveid",
                        add: false
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
    if (state != null) {
      for (var item in state) {
        print(item.recipeId);
        rows.add(
          _buildTableRow(
            item.recipeName!,
            item.people.toString(),
            _circleButton(
              color: Colors.green,
              symbol: Icons.add,
              id: item.recipeId,
              add: true,
            ),
            _circleButton(
              color: Colors.red,
              symbol: Icons.remove,
              id: item.recipeId,
              add: false,
            ),
          ),
        );
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
      children: [
        TableRow(
          decoration: BoxDecoration(color: appTheme.orangeA700),
          children: [..._headerCells()],
        ),
        ...rows
      ],
    );
  }

  TableRow _buildTableRow(
      String recipeName, String person, Widget increase, Widget decrease) {
    return TableRow(
      children: [
        _buildTableCellText(recipeName),
        _buildTableCellText(person),
        _buildTableCell(increase),
        _buildTableCell(decrease),
      ],
    );
  }

  Widget _buildTableCellText(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(Colors.black.value),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildTableCell(Widget widget) {
    return TableCell(
      child: Padding(padding: const EdgeInsets.all(8.0), child: widget),
    );
  }

  Widget _circleButton({
    required Color color,
    required IconData symbol,
    required String? id,
    required bool add,
  }) {
    return InkWell(
      onTap: () async {
        if (add) {
          await _addPerson(id);
        } else {
          await _removePerson(id);
        }
      },
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

List<Widget> _headerCells() {
  return [
    TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Recipe Name",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(Colors.white.value),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "People",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(Colors.white.value),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Add",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(Colors.white.value),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Remove",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(Colors.white.value),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ];
}

Future<void> _addPerson(String? id) async {
  print("Add to estimate: $id");
}

Future<void> _removePerson(String? id) async {
  print("Remove from estimate: $id");
}
