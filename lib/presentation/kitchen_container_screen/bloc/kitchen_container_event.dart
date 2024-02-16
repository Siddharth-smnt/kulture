// ignore_for_file: must_be_immutable

part of 'kitchen_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///KitchenContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class KitchenContainerEvent extends Equatable {}

/// Event that is dispatched when the KitchenContainer widget is first created.
class KitchenContainerInitialEvent extends KitchenContainerEvent {
  @override
  List<Object?> get props => [];
}
