import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hometending_recipe/domain/provider/auth_provider.dart';
import 'package:hometending_recipe/domain/provider/recipe_provider.dart';
import 'package:hometending_recipe/domain/provider/user_info_provider.dart';
import 'package:hometending_recipe/models/recipe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'components/add_recipe_page/cocktail_input_form.dart';
import 'components/add_recipe_page/how_to_make_input_form.dart';
import 'components/add_recipe_page/ingredient_input_form.dart';

class AddRecipePage extends HookConsumerWidget {
  const AddRecipePage({super.key});

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
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'キャンセル',
                      style: TextStyle(
                        color: Color.fromARGB(255, 119, 119, 119),
                      ),
                    ),
                  ),
                ),
                const Text(
                  '新しいレシピ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ],
            ),
          ),
          CocktailInputForm(cocktailNameController: cocktailNameController),
          IngredientInputForm(ingredientController: ingredientController),
          HowToMakeInputForm(howToMakeController: howToMakeController),
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
              await recipe.addRecipe(newRecipe);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('追加'),
          ),
        ],
      ),
    );
  }
}
