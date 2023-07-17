import 'package:flutter/material.dart';

import '../../add_recipe_page.dart';

void showAddRecipeModal(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    builder: (BuildContext context) {
      return const AddRecipePage();
    },
  );
}
