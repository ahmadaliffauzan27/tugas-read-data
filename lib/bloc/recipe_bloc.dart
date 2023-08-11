import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas1/bloc/recipe_event.dart';
import 'package:tugas1/bloc/recipe_state.dart';
import 'package:tugas1/models/api.dart';
import '../data/models/recipe/recipe_model.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeApi recipeApi = RecipeApi();

  RecipeBloc() : super(RecipeInitial()) {
    on<FetchRecipes>(_mapFetchRecipesToState);
  }

  void _mapFetchRecipesToState(
      FetchRecipes event, Emitter<RecipeState> emit) async {
    try {
      final data = await recipeApi.fetchRecipes(event.category);
      final recipes =
          List<Recipe>.from(data['meals'].map((item) => Recipe.fromJson(item)));
      emit(RecipeLoaded(recipes));
    } catch (e) {
      emit(RecipeError('Failed to fetch recipes.'));
    }
  }

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    // No need to add any code here since we registered the handler above
  }
}
