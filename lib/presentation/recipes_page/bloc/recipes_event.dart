// ignore_for_file: must_be_immutable

part of 'recipes_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Recipes widget.
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RecipesEvent extends Equatable {}

/// Event that is dispatched when the Recipes widget is first created.
class RecipesInitialEvent extends RecipesEvent {
  @override
  List<Object?> get props => [];
}

class RefreshRecipesEvent extends RecipesEvent {
  @override
  List<Object?> get props => [];
}

class AddToEstimateEvent extends RecipesEvent {
  RecipeModel recipe;
  AddToEstimateEvent({required this.recipe});
  @override
  List<Object?> get props => [];
}
