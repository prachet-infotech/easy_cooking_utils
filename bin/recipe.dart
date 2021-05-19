import 'package:meta/meta.dart';

import 'enums/affordability.enum.dart';
import 'enums/cousine.enum.dart';
import 'enums/ayurveda/digestibility.enum.dart';
import 'enums/ayurveda/food_nature.enum.dart';
import 'enums/ayurveda/mode-of-nature.enum.dart';
import 'ingredient.dart';
import 'recipe-edibility-in-seasons.dart';
import 'recipe_complexity.enum.dart';
import 'recipe_unit.enum.dart';
import 'steps-section.dart';

class Recipe {
  final String recipeId;

  final String title;
  ///markdown format/ keep simple text for now
  final String description;

  final String youtubeUrl;
  final String imageUrl;

  final List<Ingredient> ingredients;
  final List<StepsSection> steps;

  final double baseRecipe;
  final RecipeUnit recipeUnit;

  final double tasteRating;
  final double healthRating;

  final double timeToPrepareInMinutes;
  final RecipeComplexity complexity;

  final Affordability affordability;

  final Cousine cousine;

  //ayurveda
  DigestibilityEnum digestibility;

  FoodNatureEnum vataResult;
  FoodNatureEnum pittaResult;
  FoodNatureEnum kaphaResult;

  ModeOfNatureEnum modeOfNatureEnum;

  SeasonsEdibilityOfRecipe seasons;

  Recipe({
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
    @required this.digestibility,
    @required this.vataResult,
    @required this.pittaResult,
    @required this.kaphaResult,
    @required this.modeOfNatureEnum,
    @required this.seasons,
  });

  Recipe getAdjustedRecipe(double adjustedRecipe) {
    //main things to adjust.
    //1. recipe ingredients.
    //2. steps
  }
}
