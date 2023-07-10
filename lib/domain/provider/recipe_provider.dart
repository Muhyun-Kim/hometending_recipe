import 'package:hometending_recipe/domain/firebase/firebase_instance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/recipe_model.dart';

final recipeStateProvider = StateProvider((ref) => []);

final recipeProvider = Provider((ref) => Recipe());

class Recipe {
  final recipeRef = firestore.collection('recipe');

  Stream get allRecipes => recipeRef.snapshots();

  Future<bool> addRecipe(RecipeModel recipe) async {
    try {
      await recipeRef.add(recipe.toJson());
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> removeRecipe(String recipeId) async {
    try {
      await recipeRef.doc(recipeId).delete();
      return true;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<bool> editRecipe(RecipeModel recipe, String recipeId) async {
    try {
      await recipeRef.doc(recipeId).update(recipe.toJson());
      return true;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
