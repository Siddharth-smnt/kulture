// ignore_for_file: must_be_immutable

part of 'planner_bloc.dart';

/// Represents the state of Planner in the application.
class PlannerState extends Equatable {
  PlannerState({this.plannerModelObj});

  PlannerModel? plannerModelObj;

  @override
  List<Object?> get props => [
        plannerModelObj,
      ];
  PlannerState copyWith({PlannerModel? plannerModelObj}) {
    return PlannerState(
      plannerModelObj: plannerModelObj ?? this.plannerModelObj,
    );
  }
}
