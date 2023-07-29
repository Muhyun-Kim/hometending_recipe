import 'package:flutter/material.dart';
import 'package:hometending_recipe/models/recipe_model.dart';

import 'edit_recipe_page/edit_recipe_page_body.dart';

class EditRecipePage extends StatelessWidget {
  final RecipeModel recipeItem;
  final String documentId;

  const EditRecipePage({
    super.key,
    required this.recipeItem,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeItem.cocktailName),
      ),
      body: EditRecipePageBody(
        recipeItem: recipeItem,
        documentId: documentId,
      ),
    );
  }
}
