import 'package:dio/dio.dart';

import '../data/models/recipe/recipe_model.dart';

class RecipeApi {
  final Dio _dio = Dio();

  Future<List<Recipe>> fetchRecipes(String category) async {
    try {
      final response = await _dio.get(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final List<dynamic> meals = data['meals'];
        return meals.map((meal) => Recipe.fromJson(meal)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (error) {
      throw Exception("Failed to fetch data");
    }
  }
}
