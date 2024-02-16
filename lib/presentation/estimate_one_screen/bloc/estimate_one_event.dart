// ignore_for_file: must_be_immutable

part of 'estimate_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EstimateOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EstimateOneEvent extends Equatable {}

/// Event that is dispatched when the EstimateOne widget is first created.
class EstimateOneInitialEvent extends EstimateOneEvent {
  @override
  List<Object?> get props => [];
}
