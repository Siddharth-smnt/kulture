import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../sabudana_khichdi_screen/widgets/chipviewsabudan_item_widget.dart';
import 'bloc/sabudana_khichdi_bloc.dart';
import 'models/chipviewsabudan_item_model.dart';
import 'models/sabudana_khichdi_model.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/estimate_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/kitchen_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/planner_page.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/recipes_page.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_image_2.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_bottom_bar.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class SabudanaKhichdiScreen extends StatelessWidget {
  SabudanaKhichdiScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<SabudanaKhichdiBloc>(
      create: (context) => SabudanaKhichdiBloc(
        SabudanaKhichdiState(sabudanaKhichdiModelObj: SabudanaKhichdiModel(userId: '1234')),
      )..add(SabudanaKhichdiInitialEvent()),
      child: SabudanaKhichdiScreen(),
    );
  }

  // Method to fetch item names from Firestore
  static Future<List<String>> fetchItemNames(String userId) async {
    try {
      // Get a reference to the user items collection in Firestore
      CollectionReference userItemsRef =
      FirebaseFirestore.instance.collection('UserItems');

      // Query the user items collection for items with the specified userId
      QuerySnapshot querySnapshot =
      await userItemsRef.where('userId', isEqualTo: userId).get();

      // Extract item names from the query snapshot
      List<String> itemNames = [];
      querySnapshot.docs.forEach((doc) {
        String? itemName = doc['itemName']; // Use '?' for null safety
        if (itemName != null) {
          itemNames.add(itemName);
        }
      });

      return itemNames;
    } catch (e) {
      // Handle error if any
      print('Error fetching item names: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 296.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomAppBar(
                      height: 89.v,
                      leadingWidth: double.maxFinite,
                      leading: AppbarImage2(
                        svgPath: ImageConstant.imgArrowleft,
                        margin: EdgeInsets.fromLTRB(24.h, 32.v, 341.h, 16.v),
                        onTap: () {
                          onTapArrowleftone(context);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 226.v,
                        width: 312.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 226.v,
                                width: 312.h,
                                decoration: BoxDecoration(
                                  color: appTheme.orange50,
                                  borderRadius: BorderRadius.circular(156.h),
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgImage12,
                              height: 155.v,
                              width: 250.h,
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(bottom: 27.v),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 14.v,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.h, right: 26.h, bottom: 5.v),
                    child: Column(
                      children: [
                        Text(
                          "msg_sabudana_khichdi".tr,
                          style: CustomTextStyles.headlineSmallOnPrimary,
                        ),
                        SizedBox(height: 18.v),
                        SizedBox(
                          width: 342.h,
                          child: Text(
                            "msg_sabudana_khichdi2".tr,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumFigtreePrimary.copyWith(height: 1.50),
                          ),
                        ),
                        SizedBox(height: 39.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "lbl_ingredients".tr,
                            style: CustomTextStyles.titleMediumOrange900,
                          ),
                        ),
  
                        SizedBox(height: 15.v),
                        BlocSelector<SabudanaKhichdiBloc, SabudanaKhichdiState, SabudanaKhichdiModel?>(
                          selector: (state) => state.sabudanaKhichdiModelObj,
                          builder: (context, sabudanaKhichdiModelObj) {
                            if (sabudanaKhichdiModelObj == null ||
                                sabudanaKhichdiModelObj.userId == null) {
                              // Handle case where userId is null
                              return Text("User ID is null");
                            } else {
                              return FutureBuilder<List<String>>(
                                future: fetchItemNames(sabudanaKhichdiModelObj.userId!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // Placeholder while waiting for data
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}'); // Display error if any
                                  } else {
                                    List<String> itemNames = snapshot.data ?? [];
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Available Item Names:",
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),
                                        ),
                                        SizedBox(height: 10), // Add some space between the text and the list
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: itemNames.length,
                                          itemBuilder: (context, index) {
                                            return Text(itemNames[index], style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),);
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 18.v),
                        CustomOutlinedButton(
                          height: 32.v,
                          width: 101.h,
                          text: "lbl_add_item".tr,
                          isDisabled: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
          },
        ),
      ),
    );
  }

  // Rest of the code remains unchanged...

  // Navigates to the previous screen
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Kitchen:
      return AppRoutes.kitchenPage;
    case BottomBarEnum.Recipes:
      return AppRoutes.recipesPage;
    case BottomBarEnum.Planner:
      return AppRoutes.plannerPage;
    case BottomBarEnum.Estimate:
      return AppRoutes.estimatePage;
    case BottomBarEnum.Profile:
      return "/";
    default:
      return "/";
  }
}

// Navigates to the previous screen
onTapArrowleftone(BuildContext context) {
  NavigatorService.goBack();
}

