import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/condiment_item_model.dart';
import '../models/vegetableprofil_item_model.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/models/kitchen_model.dart';
part 'kitchen_event.dart';
part 'kitchen_state.dart';

/// A bloc that manages the state of a Kitchen according to the event that is dispatched to it.
class KitchenBloc extends Bloc<KitchenEvent, KitchenState> {
  KitchenBloc(KitchenState initialState) : super(initialState) {
    on<KitchenInitialEvent>(_onInitialize);
  }

  _onInitialize(
      KitchenInitialEvent event,
      Emitter<KitchenState> emit,
      ) async {
    emit(state.copyWith(
        kitchenModelObj: state.kitchenModelObj?.copyWith(
          condimentItemList: fillCondimentItemList(),
          vegetableprofilItemList: fillVegetableprofilItemList(),
        )));
  }

  List<CondimentItemModel> fillCondimentItemList() {
    return List.generate(4, (index) => CondimentItemModel.fromJson({}));
  }

  List<VegetableprofilItemModel> fillVegetableprofilItemList() {
    return List.generate(4, (index) => VegetableprofilItemModel.fromJson({}));
  }
}
