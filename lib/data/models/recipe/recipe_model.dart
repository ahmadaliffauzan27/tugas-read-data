import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    @Default('-') String strMeal,
    @Default('-') String strMealThumb,
    @Default('-') String idMeal,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
