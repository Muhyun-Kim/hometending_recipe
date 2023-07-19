import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/home_recipe_list_page/recipe_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/provider/recipe_provider.dart';

class HomeRecipeListPage extends HookConsumerWidget {
  const HomeRecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.read(recipeProvider);
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: recipe.recipeRef
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              print(snapshot);
              final docs = snapshot.data?.docs ?? [];
              return RecipeListView(
                docs: docs,
                snapshot: snapshot,
              );
            },
          ),
        ),
      ],
    );
  }
}
