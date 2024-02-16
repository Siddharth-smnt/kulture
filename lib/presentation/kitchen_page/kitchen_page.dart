import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandar_purushottam_s_application1/add_stock.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/widgets/condiment_item_widget.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/widgets/vegetableprofil_item_widget.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_image_1.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_floating_button.dart';

import 'bloc/kitchen_bloc.dart';
import 'models/condiment_item_model.dart';
import 'models/kitchen_model.dart';
import 'models/vegetableprofil_item_model.dart';

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
                      .collection('UserItems')
                      .where('category', isEqualTo: 'Condiments')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('Nothing is available',style: TextStyle(color: Colors.black),));
                    } else {
                      List<CondimentItemModel> condimentItemList =
                      snapshot.data!.docs.map((document) {
                        Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                        return CondimentItemModel.fromJson(data);
                      }).toList();

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 153.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 32.h,
                          crossAxisSpacing: 32.h,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: condimentItemList.length,
                        itemBuilder: (context, index) {
                          var docId = snapshot.data!.docs[index].id; // Retrieve document ID
                          return CondimentItemWidget(
                            condimentItemList[index],
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
                      .collection('UserItems')
                      .where('category', isEqualTo: 'Vegetables')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('Nothing is available',style: TextStyle(color: Colors.black),));

                    } else {
                      List<VegetableprofilItemModel> vegetableprofilItemList =
                      snapshot.data!.docs.map((document) {
                        Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                        return VegetableprofilItemModel.fromJson(data);
                      }).toList();

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 153.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 32.h,
                          crossAxisSpacing: 32.h,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: vegetableprofilItemList.length,
                        itemBuilder: (context, index) {
                          var docId = snapshot.data!.docs[index].id; // Retrieve document ID
                          return VegetableprofilItemWidget(
                            vegetableprofilItemList[index],
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
