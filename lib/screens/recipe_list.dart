import 'package:barrientos_assignment5/components/recipe_tile.dart';
import 'package:barrientos_assignment5/data/back_data.dart';
import 'package:barrientos_assignment5/models/category.dart';
import 'package:flutter/material.dart';

class RecipeListScreen extends StatelessWidget {
  RecipeListScreen({super.key, required this.category});

  Category category;
  var recipeList = [];

  @override
  Widget build(BuildContext context) {
    recipeList =
        RECIPES.where((recipe) => recipe.categoryId == category.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
        backgroundColor: category.color,
      ),
      body: ListView.builder(
          itemCount: recipeList.length,
          itemBuilder: (_, index) {
            return RecipeTile(recipeList[index], category);
          }),
    );
  }
}
