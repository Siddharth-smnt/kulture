import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/planner_page/models/planner_model.dart';
part 'planner_event.dart';
part 'planner_state.dart';

/// A bloc that manages the state of a Planner according to the event that is dispatched to it.
class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  PlannerBloc(PlannerState initialState) : super(initialState) {
    on<PlannerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    PlannerInitialEvent event,
    Emitter<PlannerState> emit,
  ) async {}
}
