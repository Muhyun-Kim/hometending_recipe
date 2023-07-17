import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/home_recipe_list_page/recipe_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/provider/recipe_provider.dart';

class RecipeListView extends HookConsumerWidget {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

  const RecipeListView({
    super.key,
    required this.docs,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(recipeProvider);
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final data = docs[index].data();
        final recipe = provider.mapToRecipe(data);
        return RecipeListItem(
          recipe: recipe,
          snapshot: snapshot,
          index: index,
        );
      },
    );
  }
}
