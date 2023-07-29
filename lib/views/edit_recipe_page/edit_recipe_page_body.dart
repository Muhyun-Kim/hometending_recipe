import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hometending_recipe/models/recipe_model.dart';
import 'package:hometending_recipe/views/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/provider/auth_provider.dart';
import '../../domain/provider/recipe_provider.dart';
import '../../domain/provider/user_info_provider.dart';

class EditRecipePageBody extends HookConsumerWidget {
  final RecipeModel recipeItem;
  final String documentId;

  const EditRecipePageBody({
    super.key,
    required this.recipeItem,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;
    final currentUserInfo = ref.watch(userInfoStateProvider);
    final recipe = ref.read(recipeProvider);

    final cocktailNameController = useTextEditingController();
    final ingredientController = useTextEditingController();
    final howToMakeController = useTextEditingController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.95,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '1.カクテル名',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: cocktailNameController,
                          decoration: InputDecoration(
                            hintText: recipeItem.cocktailName,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              '2. 材料名',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  材料をスペースで区切ってください',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: ingredientController,
                          decoration: InputDecoration(
                            hintText: recipeItem.ingredient
                                .map((ingredient) => ingredient.toString())
                                .join(' '),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '3. 作り方',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: howToMakeController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: recipeItem.howToMake,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final ingredientList =
                  ingredientController.text.split(RegExp(r'\s+'))..toList();
              DateTime now = DateTime.now();
              final newRecipe = RecipeModel(
                userUid: currentUser.uid,
                userName: currentUserInfo!.nickName,
                createdAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(now),
                ingredient: ingredientList,
                howToMake: howToMakeController.text,
                cocktailName: cocktailNameController.text,
                like: 0,
              );
              await recipe.editRecipe(newRecipe, documentId);

              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Text('変更'),
          ),
        ],
      ),
    );
  }
}
