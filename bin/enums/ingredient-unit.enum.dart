import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum IngredientUnit {
  //weight
  kg,
  pound,
  ounce,
  grams,

  //volume
  liter,
  cup,
  TBSP,
  tsp,
  ml,

  //count
  count
}

String getKey(IngredientUnit source, IngredientUnit target) {
  return EnumToString.convertToString(source) +
      "-" +
      EnumToString.convertToString(target);
}

Map<String, double> unitConversionMap = {
  //weight conversions
  getKey(IngredientUnit.kg, IngredientUnit.grams): 1000,
  getKey(IngredientUnit.pound, IngredientUnit.grams): 453.6,
  getKey(IngredientUnit.ounce, IngredientUnit.grams): 28.3,
  getKey(IngredientUnit.grams, IngredientUnit.grams): 1,

  //volume conversions
  getKey(IngredientUnit.liter, IngredientUnit.ml): 1000,
  getKey(IngredientUnit.cup, IngredientUnit.ml): 250,
  getKey(IngredientUnit.TBSP, IngredientUnit.ml): 15,
  getKey(IngredientUnit.tsp, IngredientUnit.ml): 5,
  getKey(IngredientUnit.ml, IngredientUnit.ml): 1,

  //interconversion
  // getKey(IngredientUnit.ml, IngredientUnit.grams): (denesity) => denesity,
};

enum IngredientUnitType { weight, volume, count }

Map<IngredientUnit, IngredientUnitType> ingredientUnitToTypeMap = {
  //weight
  IngredientUnit.kg: IngredientUnitType.weight,
  IngredientUnit.pound: IngredientUnitType.weight,
  IngredientUnit.ounce: IngredientUnitType.weight,
  IngredientUnit.grams: IngredientUnitType.weight,
  //volume
  IngredientUnit.liter: IngredientUnitType.volume,
  IngredientUnit.cup: IngredientUnitType.volume,
  IngredientUnit.TBSP: IngredientUnitType.volume,
  IngredientUnit.tsp: IngredientUnitType.volume,
  IngredientUnit.ml: IngredientUnitType.volume,
  //count
  IngredientUnit.count: IngredientUnitType.count
};

class IngredientDropdownOption extends Equatable {
  double quantity;
  IngredientUnit ingredientUnit;

  IngredientDropdownOption({
    @required this.quantity,
    @required this.ingredientUnit,
  });

  @override
  // TODO: implement props
  List<Object> get props => [quantity, ingredientUnit];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

// both quantities in in weight
IngredientDropdownOption convertSourceToTargetUnitForWeight({
  IngredientUnit sourceIngredientUnit,
  IngredientUnit targetIngredientUnit,
  double sourceQuantity,
  // double denesity,
  // double sourceQuantityTOGramUnits
}) {
  double sourceToBaseUnitFactor =
      unitConversionMap[getKey(sourceIngredientUnit, IngredientUnit.grams)];
  double targetToBaseUnitFactor =
      unitConversionMap[getKey(targetIngredientUnit, IngredientUnit.grams)];
  double sourceToTargetConversionFactor =
      sourceToBaseUnitFactor / targetToBaseUnitFactor;

  return IngredientDropdownOption(
    quantity: sourceQuantity * sourceToTargetConversionFactor,
    ingredientUnit: targetIngredientUnit,
  );
}

// both quantities in in weight
IngredientDropdownOption convertSourceToTargetUnitForVolume({
  IngredientUnit sourceIngredientUnit,
  IngredientUnit targetIngredientUnit,
  double sourceQuantity,
  // double denesity,
  // double sourceQuantityTOGramUnits
}) {
  double sourceToBaseUnitFactor =
      unitConversionMap[getKey(sourceIngredientUnit, IngredientUnit.ml)];
  double targetToBaseUnitFactor =
      unitConversionMap[getKey(targetIngredientUnit, IngredientUnit.ml)];
  if (sourceToBaseUnitFactor != null && targetToBaseUnitFactor != null) {
    double sourceToTargetConversionFactor =
        sourceToBaseUnitFactor / targetToBaseUnitFactor;

    return IngredientDropdownOption(
      quantity: sourceQuantity * sourceToTargetConversionFactor,
      ingredientUnit: targetIngredientUnit,
    );
  }
}

List<IngredientDropdownOption> generateOptions({
  IngredientUnit sourceIngredientUnit,
  double sourceQuantity,
  double ingredientDenesityKgPerLiter,
  double ingredientGramsPerUnit,
}) {
  var ingredientDropdownOptions = <IngredientDropdownOption>[];
  if (ingredientUnitToTypeMap[sourceIngredientUnit] ==
      IngredientUnitType.weight) {
    IngredientUnit.values.forEach((targetIngredientUnit) {
      if ((targetIngredientUnit != sourceIngredientUnit) &&
          (ingredientUnitToTypeMap[sourceIngredientUnit] ==
              ingredientUnitToTypeMap[targetIngredientUnit])) {
        IngredientDropdownOption option = convertSourceToTargetUnitForWeight(
          sourceIngredientUnit: sourceIngredientUnit,
          targetIngredientUnit: targetIngredientUnit,
          sourceQuantity: sourceQuantity,
        );

        ingredientDropdownOptions.add(option);
      }
    });
  }

  if (ingredientUnitToTypeMap[sourceIngredientUnit] ==
      IngredientUnitType.volume) {
    IngredientUnit.values.forEach((targetIngredientUnit) {
      if ((targetIngredientUnit != sourceIngredientUnit) &&
          (ingredientUnitToTypeMap[sourceIngredientUnit] ==
              ingredientUnitToTypeMap[targetIngredientUnit])) {
        IngredientDropdownOption option = convertSourceToTargetUnitForVolume(
          sourceIngredientUnit: sourceIngredientUnit,
          targetIngredientUnit: targetIngredientUnit,
          sourceQuantity: sourceQuantity,
        );
        ingredientDropdownOptions.add(option);
      }
    });
  }

  return ingredientDropdownOptions;
}
