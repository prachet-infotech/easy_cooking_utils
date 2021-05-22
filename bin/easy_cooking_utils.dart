import 'enums/ingredient-unit.enum.dart';
main() {
  List<IngredientDropdownOption> weightOptions = generateOptions(
      sourceIngredientUnit: IngredientUnit.kg,
      sourceQuantity: 1
  );

  print(weightOptions);

  List<IngredientDropdownOption> volumeOptions = generateOptions(
      sourceIngredientUnit: IngredientUnit.liter,
      sourceQuantity: 1
  );

  print(volumeOptions);
}

