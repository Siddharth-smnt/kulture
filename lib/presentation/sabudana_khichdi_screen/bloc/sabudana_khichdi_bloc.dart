import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/chipviewsabudan_item_model.dart';
import 'package:mandar_purushottam_s_application1/presentation/sabudana_khichdi_screen/models/sabudana_khichdi_model.dart';
part 'sabudana_khichdi_event.dart';
part 'sabudana_khichdi_state.dart';

/// A bloc that manages the state of a SabudanaKhichdi according to the event that is dispatched to it.
class SabudanaKhichdiBloc
    extends Bloc<SabudanaKhichdiEvent, SabudanaKhichdiState> {
  SabudanaKhichdiBloc(SabudanaKhichdiState initialState) : super(initialState) {
    on<SabudanaKhichdiInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _onInitialize(
    SabudanaKhichdiInitialEvent event,
    Emitter<SabudanaKhichdiState> emit,
  ) async {
    emit(state.copyWith(
        sabudanaKhichdiModelObj: state.sabudanaKhichdiModelObj?.copyWith(
            chipviewsabudanItemList: fillChipviewsabudanItemList())));
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<SabudanaKhichdiState> emit,
  ) {
    List<ChipviewsabudanItemModel> newList =
        List<ChipviewsabudanItemModel>.from(
            state.sabudanaKhichdiModelObj!.chipviewsabudanItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        sabudanaKhichdiModelObj: state.sabudanaKhichdiModelObj
            ?.copyWith(chipviewsabudanItemList: newList)));
  }

  List<ChipviewsabudanItemModel> fillChipviewsabudanItemList() {
    return List.generate(12, (index) => ChipviewsabudanItemModel());
  }
}
