import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/EstimateModel.dart';
import '/core/app_export.dart';
part 'estimate_event.dart';
part 'estimate_state.dart';

/// A bloc that manages the state of a Estimate according to the event that is dispatched to it.
class EstimateBloc extends Bloc<EstimateEvent, EstimateState> {
  EstimateBloc(EstimateState initialState) : super(initialState) {
    on<EstimateInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EstimateInitialEvent event,
    Emitter<EstimateState> emit,
  ) async {
    List<EstimateModel> initialList = await fetchEstimateList();
    emit(state.copyWith(estimateModelObj: initialList));
  }

  Future<List<EstimateModel>> fetchEstimateList() async {
    List<EstimateModel> list = [];
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('Estimate').get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        EstimateModel items = EstimateModel.fromJson(data);
        list.add(items);
      });
      return list;
    } catch (e) {
      print("Error catching Estimate items: $e");
      return list;
    }
  }
}
