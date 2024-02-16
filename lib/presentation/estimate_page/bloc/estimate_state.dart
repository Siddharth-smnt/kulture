// ignore_for_file: must_be_immutable

part of 'estimate_bloc.dart';

/// Represents the state of Estimate in the application.
class EstimateState extends Equatable {
  EstimateState({this.estimateModelObj});

  EstimateModel? estimateModelObj;

  @override
  List<Object?> get props => [
        estimateModelObj,
      ];
  EstimateState copyWith({EstimateModel? estimateModelObj}) {
    return EstimateState(
      estimateModelObj: estimateModelObj ?? this.estimateModelObj,
    );
  }
}
