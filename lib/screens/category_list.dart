import 'package:barrientos_assignment5/components/category_tile.dart';
import 'package:barrientos_assignment5/data/back_data.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  var categoryList = CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: categoryList.map((element) {
          return CategoryTile(
            category: element,
          );
        }).toList(),
      ),
    );
  }
}

//someClass.map(function(element) => return something); -> Iterable<something>.toList();
