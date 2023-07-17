import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hometending_recipe/models/recipe_model.dart';
import 'package:hometending_recipe/views/recipe_detail_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/provider/recipe_provider.dart';

class RecipeListItem extends HookConsumerWidget {
  final RecipeModel recipe;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  final int index;

  const RecipeListItem({
    super.key,
    required this.recipe,
    required this.snapshot,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(recipeProvider);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  RecipeDetailPage(
          recipe: recipe,
          snapshot: snapshot,
          index: index,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 2.0,
          ),
        ),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.cocktailName),
                Row(
                  children: recipe.ingredient
                      .map((ingredient) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Text(ingredient),
                          ))
                      .toList(),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        final documentId = snapshot.data!.docs[index].id;
                        provider.editRecipe(
                          recipe.copyWith(like: recipe.like + 1),
                          documentId,
                        );
                      },
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                      ),
                    ),
                    Text(recipe.like.toString()),
                  ],
                ),
              ],
            ),
            const Text('img')
          ],
        ),
      ),
    );
  }
}
