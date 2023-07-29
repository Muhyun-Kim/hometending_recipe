import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/edit_recipe_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/provider/auth_provider.dart';
import '../domain/provider/recipe_provider.dart';
import '../models/recipe_model.dart';
import 'components/recipe_detail_page/recipe_detail_page_body.dart';

class RecipeDetailPage extends ConsumerWidget {
  final RecipeModel recipeItem;
  final int index;
  final String documentId;

  const RecipeDetailPage({
    super.key,
    required this.recipeItem,
    required this.index,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;
    final recipe = ref.read(recipeProvider);
    final isMyRecipe = recipeItem.userUid == currentUser.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeItem.cocktailName),
        actions: [
          if (isMyRecipe)
            IconButton(
              onPressed: () {
                recipe.removeRecipe(documentId);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_outlined),
            ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  EditRecipePage(
                    recipeItem : recipeItem,
                    documentId: documentId,
                  ),
                ),
              );
            },
            child: const Text(
              '編集',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: RecipeDetailPageBody(
        recipeItem: recipeItem,
        index: index,
      ),
    );
  }
}
