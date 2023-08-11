import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas1/bloc/recipe_event.dart';
import 'package:tugas1/bloc/recipe_state.dart';
import 'package:tugas1/models/api.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeApi recipeApi = RecipeApi();

  RecipeBloc() : super(RecipeInitial()) {
    on<FetchRecipes>(_mapFetchRecipesToState);
  }

  void _mapFetchRecipesToState(
      FetchRecipes event, Emitter<RecipeState> emit) async {
    try {
      final data = await recipeApi.fetchRecipes(event.category);
      emit(RecipeLoaded(data));
    } catch (e) {
      emit(const RecipeError('Failed to fetch recipes.'));
    }
  }

  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    // No need to add any code here since we registered the handler above
  }
}
