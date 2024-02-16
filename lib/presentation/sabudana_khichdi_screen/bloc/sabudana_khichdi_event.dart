// ignore_for_file: must_be_immutable

part of 'sabudana_khichdi_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SabudanaKhichdi widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SabudanaKhichdiEvent extends Equatable {}

/// Event that is dispatched when the SabudanaKhichdi widget is first created.
class SabudanaKhichdiInitialEvent extends SabudanaKhichdiEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing ChipView selection
class UpdateChipViewEvent extends SabudanaKhichdiEvent {
  UpdateChipViewEvent({
    required this.index,
    this.isSelected,
  });

  int index;

  bool? isSelected;

  @override
  List<Object?> get props => [
        index,
        isSelected,
      ];
}
