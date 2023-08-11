import 'package:dio/dio.dart';

class RecipeApi {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchRecipes(String category) async {
    try {
      final response = await _dio.get(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (error) {
      throw Exception("Failed to fetch data");
    }
  }
}
