import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/home_recipe_list_page/recipe_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/provider/recipe_provider.dart';
import '../add_recipe_page/show_add_recipe_modal.dart';

class HomeRecipeListPage extends HookConsumerWidget {
  const HomeRecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.read(recipeProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: recipe.recipeRef
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                final docs = snapshot.data?.docs ?? [];
                return RecipeListView(
                  docs: docs,
                  snapshot: snapshot,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddRecipeModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
