import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandar_purushottam_s_application1/UserModel/InventoryModel.dart';
import 'package:mandar_purushottam_s_application1/add_stock.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/bloc/kitchen_bloc.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/models/kitchen_model.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/widgets/Inventory_Item_Widget.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_image_1.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_floating_button.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<KitchenBloc>(
      create: (context) => KitchenBloc(KitchenState(
        kitchenModelObj: KitchenModel(),
      ))
        ..add(KitchenInitialEvent()),
      child: KitchenPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 89.v,
          title: AppbarImage(
            imagePath: ImageConstant.imgLogo21,
            margin: EdgeInsets.only(left: 24.h),
          ),
          actions: [
            AppbarImage1(
              svgPath: ImageConstant.imgSearch,
              margin: EdgeInsets.fromLTRB(24.h, 29.v, 24.h, 21.v),
            ),
          ],
          styleType: Style.bgFill,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_what_we_have".tr,
                  style: CustomTextStyles.headlineSmallOnPrimary,
                ),
                SizedBox(height: 24.v),
                Text(
                  "lbl_condiments".tr,
                  style: CustomTextStyles.titleMediumOrange900,
                ),
                SizedBox(height: 22.v),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Inventory')
                      .where('category', isEqualTo: 'Condiments')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Text(
                        'Nothing is available',
                        style: TextStyle(color: Colors.black),
                      ));
                    } else {
                      List<InventoryModel> condimentsList =
                          snapshot.data!.docs.map((document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return InventoryModel.fromJson(data);
                      }).toList();

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 153.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 32.h,
                          crossAxisSpacing: 32.h,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: condimentsList.length,
                        itemBuilder: (context, index) {
                          var docId = snapshot
                              .data!.docs[index].id; // Retrieve document ID
                          return InventoryItemWidget(
                            condimentsList[index],
                            docId: docId,
                          );
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: 37.v),
                Text(
                  "lbl_vegetables".tr,
                  style: CustomTextStyles.titleMediumOrange900,
                ),
                SizedBox(height: 22.v),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Inventory')
                      .where('category', isEqualTo: 'Vegetables')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Text(
                        'Nothing is available',
                        style: TextStyle(color: Colors.black),
                      ));
                    } else {
                      List<InventoryModel> vegetableList =
                          snapshot.data!.docs.map((document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return InventoryModel.fromJson(data);
                      }).toList();

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 153.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 32.h,
                          crossAxisSpacing: 32.h,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: vegetableList.length,
                        itemBuilder: (context, index) {
                          var docId = snapshot
                              .data!.docs[index].id; // Retrieve document ID
                          return InventoryItemWidget(
                            vegetableList[index],
                            docId: docId,
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFloatingButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddItemScreen()),
            );
          },
          iconPath: ImageConstant.imgPlus,
        ),
      ),
    );
  }
}
