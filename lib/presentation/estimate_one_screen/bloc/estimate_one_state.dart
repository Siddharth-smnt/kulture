// ignore_for_file: must_be_immutable

part of 'estimate_one_bloc.dart';

/// Represents the state of EstimateOne in the application.
class EstimateOneState extends Equatable {
  EstimateOneState({this.estimateOneModelObj});

  EstimateOneModel? estimateOneModelObj;

  @override
  List<Object?> get props => [
        estimateOneModelObj,
      ];
  EstimateOneState copyWith({EstimateOneModel? estimateOneModelObj}) {
    return EstimateOneState(
      estimateOneModelObj: estimateOneModelObj ?? this.estimateOneModelObj,
    );
  }
}
