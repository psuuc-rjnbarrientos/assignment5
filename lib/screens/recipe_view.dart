import 'package:barrientos_assignment5/models/category.dart';
import 'package:barrientos_assignment5/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeViewScreen extends StatelessWidget {
  RecipeViewScreen(this.recipe, this.category, {super.key});

  Recipe recipe;
  Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        backgroundColor: category.color,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: recipe.imageUrl == null
                    ? const Text('No Image Available')
                    : Image.network(
                        recipe.imageUrl!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const TabBar(
              labelColor: Colors.blue,
              indicatorColor: Colors.red,
              tabs: [
                Tab(
                  text: 'Ingredients',
                  icon: Icon(Icons.restaurant_menu),
                ),
                Tab(
                  text: 'Steps',
                  icon: Icon(Icons.directions),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      if (recipe.ingredients != null)
                        ...recipe.ingredients!
                            .map(
                              (item) => Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Text('• $item'),
                                ),
                              ),
                            )
                            .toList()
                      else
                        const Text('No Ingredients Available'),
                    ],
                  ),
                  ListView(
                    children: [
                      if (recipe.steps != null)
                        ...recipe.steps!
                            .map(
                              (item) => Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Text('• $item'),
                                ),
                              ),
                            )
                            .toList()
                      else
                        const Text('No Steps Available'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
