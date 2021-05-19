import '../enums/affordability.enum.dart';
import '../enums/ayurveda/digestibility.enum.dart';
import '../enums/ayurveda/food_nature.enum.dart';
import '../enums/ayurveda/mode-of-nature.enum.dart';
import '../enums/cousine.enum.dart';
import '../enums/ingredient-unit.enum.dart';
import '../ingredient.dart';
import '../ingredients-section.dart';
import '../recipe-edibility-in-seasons.dart';
import '../recipe.dart';
import '../recipe_complexity.enum.dart';
import '../recipe_unit.enum.dart';
import '../steps-section.dart';

Recipe khichri = Recipe(
  recipeId: "1",
  title: "Makhana pag",
  description: "Makhana pag",
  youtubeUrl: "https://youtu.be/1oGyrt62bi0",
  imageUrl: null,
  ingredientSections: [
    IngredientsSection(
      ingredients: [
        Ingredient(
            id: "makhane",
            displayName: "Makhane",
            quantity: 50,
            ingredientUnit: IngredientUnit.grams),
        Ingredient(
            id: "ghee",
            displayName: "Ghee",
            quantity: 150,
            ingredientUnit: IngredientUnit.grams)
      ],
    ),
    IngredientsSection(
      sectionTitle: "Sugar Syrup",
      ingredients: [
        Ingredient(
            id: "sugar",
            displayName: "Sugar",
            quantity: 250,
            ingredientUnit: IngredientUnit.grams),
        Ingredient(
            id: "milk",
            displayName: "Milk",
            quantity: 1,
            ingredientUnit: IngredientUnit.TBSP),
        Ingredient(
            id: "water",
            displayName: "Water",
            quantity: .75,
            ingredientUnit: IngredientUnit.liter),
      ],
    ),
  ],
  stepSections: [
    StepsSection(steps: ["Roast _makhana in _ghee"]),
    StepsSection(sectionTitle: "Prepare Chashni", steps: [
      "boil _water",
      "add _sugar",
      "test on weather the item is ready",
    ])
  ],
  baseRecipe: 3,
  recipeUnit: RecipeUnit.Cup,
  tasteRating: 4.5,
  healthRating: 4.5,
  timeToPrepareInMinutes: 20,
  complexity: RecipeComplexity.Simple,
  affordability: Affordability.Affordable,
  cousine: Cousine.All,
  digestibility: DigestibilityEnum.Medium,
  vataResult: FoodNatureEnum.Aggrevating,
  pittaResult: FoodNatureEnum.Pacifying,
  kaphaResult: FoodNatureEnum.Neutral,
  modeOfNatureEnum: ModeOfNatureEnum.Sattva,
  seasons: SeasonsEdibilityOfRecipe(
    greeshma: true,
    hemant: true,
    sharad: true,
    shishir: true,
    varsha: true,
    vasant: true,
  ),
);
