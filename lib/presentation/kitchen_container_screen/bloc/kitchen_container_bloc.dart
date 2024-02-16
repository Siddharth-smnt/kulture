import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_container_screen/models/kitchen_container_model.dart';
part 'kitchen_container_event.dart';
part 'kitchen_container_state.dart';

/// A bloc that manages the state of a KitchenContainer according to the event that is dispatched to it.
class KitchenContainerBloc
    extends Bloc<KitchenContainerEvent, KitchenContainerState> {
  KitchenContainerBloc(KitchenContainerState initialState)
      : super(initialState) {
    on<KitchenContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    KitchenContainerInitialEvent event,
    Emitter<KitchenContainerState> emit,
  ) async {}
}
