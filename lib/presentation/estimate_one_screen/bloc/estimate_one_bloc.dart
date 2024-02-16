import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/estimate_one_screen/models/estimate_one_model.dart';
part 'estimate_one_event.dart';
part 'estimate_one_state.dart';

/// A bloc that manages the state of a EstimateOne according to the event that is dispatched to it.
class EstimateOneBloc extends Bloc<EstimateOneEvent, EstimateOneState> {
  EstimateOneBloc(EstimateOneState initialState) : super(initialState) {
    on<EstimateOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EstimateOneInitialEvent event,
    Emitter<EstimateOneState> emit,
  ) async {}
}
