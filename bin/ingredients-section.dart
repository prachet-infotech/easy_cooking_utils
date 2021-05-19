import 'package:meta/meta.dart';

import 'ingredient.dart';

class IngredientsSection {
  final String sectionTitle;
  final List<Ingredient> ingredients;

  const IngredientsSection({
    this.sectionTitle,
    @required this.ingredients,
  });
}
