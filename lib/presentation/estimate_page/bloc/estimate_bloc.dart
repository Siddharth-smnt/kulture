import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_page/models/estimate_model.dart';
part 'estimate_event.dart';
part 'estimate_state.dart';

/// A bloc that manages the state of a Estimate according to the event that is dispatched to it.
class EstimateBloc extends Bloc<EstimateEvent, EstimateState> {
  EstimateBloc(EstimateState initialState) : super(initialState) {
    on<EstimateInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EstimateInitialEvent event,
    Emitter<EstimateState> emit,
  ) async {}
}
