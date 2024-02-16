// ignore_for_file: must_be_immutable

part of 'sabudana_khichdi_bloc.dart';

/// Represents the state of SabudanaKhichdi in the application.
class SabudanaKhichdiState extends Equatable {
  SabudanaKhichdiState({this.sabudanaKhichdiModelObj});

  SabudanaKhichdiModel? sabudanaKhichdiModelObj;

  @override
  List<Object?> get props => [
        sabudanaKhichdiModelObj,
      ];
  SabudanaKhichdiState copyWith(
      {SabudanaKhichdiModel? sabudanaKhichdiModelObj}) {
    return SabudanaKhichdiState(
      sabudanaKhichdiModelObj:
          sabudanaKhichdiModelObj ?? this.sabudanaKhichdiModelObj,
    );
  }
}
