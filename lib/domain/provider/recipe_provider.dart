import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hometending_recipe/domain/firebase/firebase_instance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/recipe_model.dart';

class RecipeState {
  List<RecipeModel> recipes = [];
  bool isLoading = false;
  String error = '';
}

final recipeProvider = Provider((ref) => Recipe());

class Recipe {
  final recipeRef = firestore.collection('recipe');

  Stream<QuerySnapshot<Map<String, dynamic>>> get allRecipes =>
      recipeRef.orderBy('createdAt', descending: true).snapshots();

  RecipeModel mapToRecipe(Map<String, dynamic> data) {
    return RecipeModel(
      userUid: data['userUid'],
      userName: data['userName'],
      createdAt: data['createdAt'],
      ingredient: (data['ingredient'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      howToMake: data['howToMake'],
      cocktailName: data['cocktailName'],
      like: data['like'],
    );
  }

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
