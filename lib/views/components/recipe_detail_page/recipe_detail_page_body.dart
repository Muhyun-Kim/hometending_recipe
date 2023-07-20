import 'package:flutter/material.dart';

import '../../../models/recipe_model.dart';

class RecipeDetailPageBody extends StatelessWidget {
  final RecipeModel recipeItem;
  final int index;

  const RecipeDetailPageBody({
    super.key,
    required this.recipeItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'カクテル名',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(recipeItem.cocktailName),
            Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: const Center(
                child: Text('img'),
              ),
            ),
            const Text(
              '材料',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipeItem.ingredient
                  .map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Text(ingredient),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Text(
              '作り方',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(recipeItem.howToMake),
            ),
          ],
        ),
      ),
    );
  }
}
