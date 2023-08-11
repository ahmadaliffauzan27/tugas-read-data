import 'package:equatable/equatable.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object?> get props => [];
}

class FetchRecipes extends RecipeEvent {
  final String category;

  const FetchRecipes(this.category);

  @override
  List<Object?> get props => [category];
}
