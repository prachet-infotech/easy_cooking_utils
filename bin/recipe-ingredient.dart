import 'package:meta/meta.dart';
import 'enums/ingredient-unit.enum.dart';

class RecipeIngredient {
  ///Ingredient Key
  final String id;

  final String displayName;
  final double quantity;
  final double adjustedQuantity;
  final IngredientUnit ingredientUnit;
  final String adjective;

  ///For internal use only
  final String comment;

  const RecipeIngredient({
    @required this.id,
    @required this.displayName,
    @required this.quantity,
    this.adjustedQuantity,
    @required this.ingredientUnit,
    this.adjective,
    this.comment,
  });
}
