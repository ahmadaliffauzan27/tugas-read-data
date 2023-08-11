import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas1/bloc/recipe_bloc.dart';
import 'package:tugas1/bloc/recipe_event.dart';
import 'package:tugas1/bloc/recipe_state.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecipeBloc>(context).add(const FetchRecipes('beef'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes App'),
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeLoaded) {
            final recipes = state.recipes;

            if (recipes.isNotEmpty) {
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListTile(
                        leading: recipe.strMealThumb.isNotEmpty
                            ? CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(recipe.strMealThumb),
                              )
                            : null,
                        title: Text(recipe.strMeal),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No recipes available.'));
            }
          } else if (state is RecipeError) {
            return Center(child: Text(state.message));
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
