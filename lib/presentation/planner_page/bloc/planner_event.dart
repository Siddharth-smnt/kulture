// ignore_for_file: must_be_immutable

part of 'planner_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Planner widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PlannerEvent extends Equatable {}

/// Event that is dispatched when the Planner widget is first created.
class PlannerInitialEvent extends PlannerEvent {
  @override
  List<Object?> get props => [];
}
