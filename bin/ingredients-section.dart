import 'package:meta/meta.dart';

import 'recipe-ingredient.dart';

class IngredientsSection {
  final String sectionTitle;
  final List<RecipeIngredient> ingredients;

  const IngredientsSection({
    this.sectionTitle,
    @required this.ingredients,
  });
}
