// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [estimate_page],
/// and is typically used to hold data that is passed between different parts of the application.
class EstimateModel extends Equatable {
  EstimateModel() {}

  EstimateModel copyWith() {
    return EstimateModel();
  }

  @override
  List<Object?> get props => [];
}
