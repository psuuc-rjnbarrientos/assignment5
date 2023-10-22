import 'package:barrientos_assignment5/models/category.dart';
import 'package:barrientos_assignment5/models/recipe.dart';
import 'package:barrientos_assignment5/screens/recipe_view.dart';
import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  RecipeTile(this.recipe, this.category, {super.key});

  Recipe recipe;
  Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          print('Recipe Tile Pressed');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => RecipeViewScreen(recipe, category)));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: recipe.imageUrl == null
                        ? const Center(
                            child: Text('No Image Available'),
                          )
                        : Image.network(
                            recipe.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.black45,
                      child: Text(
                        recipe.name,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.timer),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${recipe.duration} minute(s)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
