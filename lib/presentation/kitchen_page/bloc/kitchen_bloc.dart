import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/InventoryModel.dart';
import '/core/app_export.dart';
part 'kitchen_event.dart';
part 'kitchen_state.dart';

/// A bloc that manages the state of a Kitchen according to the event that is dispatched to it.
class KitchenBloc extends Bloc<KitchenEvent, KitchenState> {
  KitchenBloc(KitchenState initialState) : super(initialState) {
    on<KitchenInitialEvent>(_onInitialize);
  }

  _onInitialize(KitchenInitialEvent event, Emitter<KitchenState> emit) async {
    emit(state.copyWith(kitchenList: await fetchInventoryItems()));
  }

  Future<List<InventoryModel>> fetchInventoryItems() async {
    List<InventoryModel> inventoryItems = [];
    try {
      // Fetch recipes from Firestore
      var querySnapshot =
          await FirebaseFirestore.instance.collection('Inventory').get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        // Assuming your RecipeItemModel class has a constructor that takes a Map
        print(data);
        InventoryModel item = InventoryModel.fromJson(data);
        inventoryItems.add(item);
      });
      return inventoryItems;
    } catch (e) {
      print("Error catching recipes: $e");
      return [];
    }
  }
}
