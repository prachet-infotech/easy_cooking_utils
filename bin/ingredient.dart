

import 'ingredient.enum.dart';

class Ingredient {
  ///Ingredient Key
  String id;

  String displayName;
  double quantity;
  IngredientUnit ingredientUnit;
  String adjective;

  ///For internal use only
  String comment;
}
