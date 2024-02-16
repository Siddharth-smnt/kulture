// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [estimate_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EstimateOneModel extends Equatable {
  EstimateOneModel() {}

  EstimateOneModel copyWith() {
    return EstimateOneModel();
  }

  @override
  List<Object?> get props => [];
}
