import 'package:barrientos_assignment5/models/category.dart';
import 'package:barrientos_assignment5/screens/recipe_list.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});

  Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(category.name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipeListScreen(
              category: category,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color, category.color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            category.name,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
