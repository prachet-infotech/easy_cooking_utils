import 'package:meta/meta.dart';

import 'affordability.enum.dart';
import 'cousine.enum.dart';
import 'ingredient.dart';
import 'recipe_complexity.enum.dart';
import 'recipe_unit.enum.dart';

class Recipe {
  final String recipeId;

  final String title;
  ///markdown format/ keep simple text for now
  final String description;

  final String youtubeUrl;
  final String imageUrl;

  final List<Ingredient> ingredients;
  final List<String> steps;

  final double baseRecipe;
  final RecipeUnit recipeUnit;

  final double tasteRating;
  final double healthRating;

  final double timeToPrepareInMinutes;
  final RecipeComplexity complexity;

  final Affordability affordability;

  final Cousine cousine;

  const Recipe({
    @required this.recipeId,
    @required this.title,
    @required this.description,
    @required this.youtubeUrl,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.baseRecipe,
    @required this.recipeUnit,
    @required this.tasteRating,
    @required this.healthRating,
    @required this.timeToPrepareInMinutes,
    @required this.complexity,
    @required this.affordability,
    @required this.cousine,
  });
}
