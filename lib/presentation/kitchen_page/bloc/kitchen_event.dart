// ignore_for_file: must_be_immutable

part of 'kitchen_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Kitchen widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class KitchenEvent extends Equatable {}

/// Event that is dispatched when the Kitchen widget is first created.
class KitchenInitialEvent extends KitchenEvent {
  @override
  List<Object?> get props => [];
}
