import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/EstimateModel.dart';
import 'package:mandar_purushottam_s_application1/UserModel/InventoryModel.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/pdf/pdf_api.dart';
import 'package:mandar_purushottam_s_application1/pdf/pdf_invoice_api.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/bloc/estimate_bloc.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';

class EstimatePage extends StatelessWidget {
  EstimatePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EstimateBloc>(
      create: (context) =>
          EstimateBloc(EstimateState())..add(EstimateInitialEvent()),
      child: EstimatePage(),
    );
  }

  final AuthServices _auth = AuthServices();
  List<IngredientModel> allNotAvailableItemList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EstimateBloc, EstimateState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                            decoration:
                                BoxDecoration(color: appTheme.orangeA700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.v),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: BlocBuilder<EstimateBloc, EstimateState>(
                          buildWhen: (previous, current) => current != previous,
                          builder: (context, state) {
                            return _buildTable(state.estimateModelObj, context);
                          },
                        ),
                      ),
                      SizedBox(height: 20.v),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("User")
                            .doc(_auth.user?.uid)
                            .collection('Estimate')
                            .where("notAvailableItems", isNull: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData &&
                              snapshot.data!.docs.isEmpty) {
                            return Center(
                                child: Text(
                              'Nothing to buy',
                              style: TextStyle(color: Colors.black),
                            ));
                          } else {
                            List<EstimateModel> toBuyList =
                                snapshot.data!.docs.map((doc) {
                              Map<String, dynamic> data =
                                  doc.data() as Map<String, dynamic>;
                              return EstimateModel.fromJson(data);
                            }).toList();
                            for (var estimate in toBuyList) {
                              allNotAvailableItemList.addAll(
                                  estimate.notAvailableItems
                                      as Iterable<IngredientModel>);
                            }
                            return _itemsToBuyTable(allNotAvailableItemList);
                          }
                        },
                      ),
                      SizedBox(height: 20.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("User")
                                  .doc(_auth.user?.uid)
                                  .collection("Estimate")
                                  .get()
                                  .then((snapshot) {
                                for (DocumentSnapshot ds in snapshot.docs) {
                                  ds.reference.delete();
                                }
                              });
                              Navigator.pushNamed(
                                  context, AppRoutes.kitchenPage);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFCC5602),
                            ),
                            child: Text(
                              'Execute',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final pdfFile = await PdfInvoiceApi.generate(
                                  allNotAvailableItemList);
                              PdfApi.openFile(pdfFile);
                              // print("Share button clicked");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFCC5602),
                            ),
                            child: Text(
                              'Share',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _itemsToBuyTable(List<IngredientModel>? list) {
    List<TableRow> rows = [];
    if (list != null) {
      for (var item in list) {
        rows.add(
          TableRow(children: [
            _buildEstimateTableCellText(item.name),
            _buildEstimateTableCellText(item.quantity.toString()),
            _buildEstimateTableCellText(item.unit),
          ]),
        );
      }
    }
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1.85), // Adjust the width of the columns as needed
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      border: TableBorder.all(),
      children: [
        TableRow(
          decoration: BoxDecoration(color: appTheme.orangeA700),
          children: [..._estimateHeaderCells()],
        ),
        ...rows
      ],
    );
  }

  Widget _buildEstimateTableCellText(String text) {
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

  List<Widget> _estimateHeaderCells() {
    return [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Ingredient",
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
            "Quantity",
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
            "Unit",
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

  Widget _buildTable(List<EstimateModel>? state, BuildContext context) {
    List<TableRow> rows = [];
    if (state != null) {
      for (var item in state) {
        rows.add(
          _buildTableRow(
            item.recipeName!,
            item.peopleCount.toString(),
            _circleButton(
                color: Colors.green,
                symbol: Icons.add,
                id: item.recipeId,
                peopleCount: item.peopleCount,
                add: true,
                context: context),
            _circleButton(
                color: Colors.red,
                symbol: Icons.remove,
                id: item.recipeId,
                peopleCount: item.peopleCount,
                add: false,
                context: context),
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

  Widget _circleButton(
      {required Color color,
      required IconData symbol,
      required String? id,
      required bool add,
      required int? peopleCount,
      required BuildContext context}) {
    return InkWell(
      onTap: () async {
        if (add) {
          await _addPerson(
              id, peopleCount, BlocProvider.of<EstimateBloc>(context));
        } else {
          await _removePerson(
              id, peopleCount, BlocProvider.of<EstimateBloc>(context));
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

  Future<void> _addPerson(
      String? recipeId, int? peopleCount, EstimateBloc bloc) async {
    DocumentSnapshot estimateSnapshot = await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection('Estimate')
        .doc(recipeId)
        .get();
    Map<String, dynamic> estimateData =
        estimateSnapshot.data() as Map<String, dynamic>;
    List<IngredientModel> estimateItems =
        EstimateModel.fromJson(estimateData).notAvailableItems ?? [];

    if (estimateItems.isEmpty) {
      await _addNewPerson(recipeId, peopleCount, bloc);
      return;
    }
    // fetch recipe ingredients
    DocumentSnapshot recipeSnapshot = await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection('Recipes')
        .doc(recipeId)
        .get();

    Map<String, dynamic> data = recipeSnapshot.data() as Map<String, dynamic>;
    List<IngredientModel> recipeItems = RecipeModel.fromJson(data).ingredients;

    for (var recipeItem in recipeItems) {
      var matchingItemIndex =
          estimateItems.indexWhere((item) => item.name == recipeItem.name);
      estimateItems[matchingItemIndex].quantity += recipeItem.quantity;
    }

    // update firebase estimate collection
    EstimateModel newDoc = EstimateModel(
        recipeId: recipeId,
        recipeName: RecipeModel.fromJson(data).recipeName,
        notAvailableItems: estimateItems,
        peopleCount: peopleCount! + 1);
    await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection("Estimate")
        .doc(recipeId)
        .set(newDoc.toJson(), SetOptions(merge: true));
    bloc.add(EstimateInitialEvent());
  }

  Future<void> _addNewPerson(
      String? recipeId, int? peopleCount, EstimateBloc bloc) async {
    // fetch recipe ingredients
    DocumentSnapshot recipeSnapshot = await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection('Recipes')
        .doc(recipeId)
        .get();

    Map<String, dynamic> data = recipeSnapshot.data() as Map<String, dynamic>;
    List<IngredientModel> recipeItems = RecipeModel.fromJson(data).ingredients;

    // fetch kitchen items
    QuerySnapshot inventorySnapshot = await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection('Inventory')
        .get();
    List<InventoryModel> kitchenDocs = inventorySnapshot.docs
        .map((doc) =>
            InventoryModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    Map<String, int> availableIngredients = {};
    for (var item in kitchenDocs) {
      availableIngredients[item.itemName.toLowerCase()] = item.quantity;
    }

    // generate items to buy list
    List<IngredientModel> itemsToBuy = [];
    int dishesToAdd = peopleCount! + 1;

    for (var item in recipeItems) {
      if (availableIngredients.containsKey(item.name.toLowerCase())) {
        int possibleDishes =
            availableIngredients[item.name.toLowerCase()]! ~/ item.quantity;
        if (possibleDishes < dishesToAdd) {
          int quantityNeeded = (dishesToAdd - possibleDishes) * item.quantity;
          itemsToBuy.add(IngredientModel(
              name: item.name, quantity: quantityNeeded, unit: item.unit));
        }
      } else {
        itemsToBuy.add(item);
      }
    }
    // Update kitchenItems with the increased quantities and print the list of ingredients to buy
    print("Increased count of dishes is $peopleCount");
    print("Ingredients to buy:");
    for (var item in itemsToBuy) {
      print("${item.name} ${item.quantity} ${item.unit}");
    }

    // update firebase estimate collection
    EstimateModel newDoc = EstimateModel(
        recipeId: recipeId,
        recipeName: RecipeModel.fromJson(data).recipeName,
        notAvailableItems: itemsToBuy,
        peopleCount: dishesToAdd);
    await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection("Estimate")
        .doc(recipeId)
        .set(newDoc.toJson(), SetOptions(merge: true));
    bloc.add(EstimateInitialEvent());
  }

  Future<void> _removePerson(
      String? recipeId, int? peopleCount, EstimateBloc bloc) async {
    // fetch recipe ingredients
    DocumentSnapshot recipeSnapshot = await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection('Recipes')
        .doc(recipeId)
        .get();

    Map<String, dynamic> data = recipeSnapshot.data() as Map<String, dynamic>;
    List<IngredientModel> recipeItems = RecipeModel.fromJson(data).ingredients;

    // fetch estimate items
    DocumentSnapshot estimateSnapshot = await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection('Estimate')
        .doc(recipeId)
        .get();
    Map<String, dynamic> estimateData =
        estimateSnapshot.data() as Map<String, dynamic>;
    List<IngredientModel> estimateItems =
        EstimateModel.fromJson(estimateData).notAvailableItems ?? [];

    if (estimateItems.isEmpty) return;

    for (var recipeItem in recipeItems) {
      // estimateItems.forEach((element) {
      //   element.quantity = (element.quantity - item.quantity) >= 0
      //       ? (element.quantity - item.quantity)
      //       : 0;
      // });
      var matchingItemIndex =
          estimateItems.indexWhere((item) => item.name == recipeItem.name);
      estimateItems[matchingItemIndex].quantity =
          (estimateItems[matchingItemIndex].quantity - recipeItem.quantity) >= 0
              ? (estimateItems[matchingItemIndex].quantity -
                  recipeItem.quantity)
              : 0;
    }

    // update firebase estimate collection
    EstimateModel newDoc = EstimateModel(
        recipeId: recipeId,
        recipeName: RecipeModel.fromJson(data).recipeName,
        notAvailableItems: estimateItems,
        peopleCount: peopleCount! - 1);
    await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection("Estimate")
        .doc(recipeId)
        .set(newDoc.toJson(), SetOptions(merge: true));
    bloc.add(EstimateInitialEvent());
  }
}
