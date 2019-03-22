class Nutriments {
  String sugarsServing;
  String carbohydrates;
  String salt100g;
  String fat100g;
  String carbohydrates100g;
  String saturatedFatValue;
  String proteinsUnit;
  String salt;
  String sugars100g;
  String sugars;
  String energyServing;
  String fatUnit;
  String energy;
  String nutritionScoreFr;
  String energy100g;
  String nutritionScoreUk100g;
  String saltServing;
  String saturatedFatUnit;
  String fatValue;
  String saltUnit;
  String proteins;
  String proteins100g;
  String carbohydratesServing;
  String saturatedFat;
  String energyUnit;
  String fat;
  String fatServing;
  String proteinsServing;
  String sodiumValue;
  String saltValue;
  String sugarsValue;
  String energyValue;
  String sodium100g;
  String nutritionScoreUk;
  String sodium;
  String saturatedFat100g;
  String nutritionScoreFr100g;
  String carbohydratesValue;
  String carbohydratesUnit;
  String saturatedFatServing;
  String sodiumServing;
  String proteinsValue;
  String sugarsUnit;
  String sodiumUnit;

  Nutriments(
      {this.sugarsServing,
      this.carbohydrates,
      this.salt100g,
      this.fat100g,
      this.carbohydrates100g,
      this.saturatedFatValue,
      this.proteinsUnit,
      this.salt,
      this.sugars100g,
      this.sugars,
      this.energyServing,
      this.fatUnit,
      this.energy,
      this.nutritionScoreFr,
      this.energy100g,
      this.nutritionScoreUk100g,
      this.saltServing,
      this.saturatedFatUnit,
      this.fatValue,
      this.saltUnit,
      this.proteins,
      this.proteins100g,
      this.carbohydratesServing,
      this.saturatedFat,
      this.energyUnit,
      this.fat,
      this.fatServing,
      this.proteinsServing,
      this.sodiumValue,
      this.saltValue,
      this.sugarsValue,
      this.energyValue,
      this.sodium100g,
      this.nutritionScoreUk,
      this.sodium,
      this.saturatedFat100g,
      this.nutritionScoreFr100g,
      this.carbohydratesValue,
      this.carbohydratesUnit,
      this.saturatedFatServing,
      this.sodiumServing,
      this.proteinsValue,
      this.sugarsUnit,
      this.sodiumUnit});

  Nutriments.fromJson(Map<String, dynamic> json) {
    sugarsServing = json.containsKey('sugars_serving') == true
        ? json['sugars_serving'] is String
            ? json['sugars_serving']
            : json['sugars_serving'].toString()
        : null;
    carbohydrates = json.containsKey('carbohydrates') == true
        ? json['carbohydrates'] is String
            ? json['carbohydrates']
            : json['carbohydrates'].toString()
        : null;
    salt100g = json.containsKey('salt_100g') == true
        ? json['salt_100g'] is String
            ? json['salt_100g']
            : json['salt_100g'].toString()
        : null;
    fat100g = json.containsKey('fat_100g') == true
        ? json['fat_100g'] is String
            ? json['fat_100g']
            : json['fat_100g'].toString()
        : null;
    carbohydrates100g = json.containsKey('carbohydrates_100g') == true
        ? json['carbohydrates_100g'] is String
            ? json['carbohydrates_100g']
            : json['carbohydrates_100g'].toString()
        : null;
    saturatedFatValue = json.containsKey('saturated-fat_value') == true
        ? json['saturated-fat_value'] is String
            ? json['saturated-fat_value']
            : json['saturated-fat_value'].toString()
        : null;
    proteinsUnit = json.containsKey('proteins_unit') == true
        ? json['proteins_unit'] is String
            ? json['proteins_unit']
            : json['proteins_unit'].toString()
        : null;
    salt = json.containsKey('salt') == true
        ? json['salt'] is String ? json['salt'] : json['salt'].toString()
        : null;
    sugars100g = json.containsKey('sugars_100g') == true
        ? json['sugars_100g'] is String
            ? json['sugars_100g']
            : json['sugars_100g'].toString()
        : null;
    sugars = json.containsKey('sugars') == true
        ? json['sugars'] is String ? json['sugars'] : json['sugars'].toString()
        : null;
    energyServing = json.containsKey('energy_serving') == true
        ? json['energy_serving'] is String
            ? json['energy_serving']
            : json['energy_serving'].toString()
        : null;
    fatUnit = json.containsKey('fat_unit') == true
        ? json['fat_unit'] is String
            ? json['fat_unit']
            : json['fat_unit'].toString()
        : null;
    energy = json.containsKey('energy') == true
        ? json['energy'] is String ? json['energy'] : json['energy'].toString()
        : null;
    nutritionScoreFr = json.containsKey('nutrition-score-fr') == true
        ? json['nutrition-score-fr'] is String
            ? json['nutrition-score-fr']
            : json['nutrition-score-fr'].toString()
        : null;
    energy100g = json.containsKey('energy_100g') == true
        ? json['energy_100g'] is String
            ? json['energy_100g']
            : json['energy_100g'].toString()
        : null;
    nutritionScoreUk100g = json.containsKey('nutrition-score-uk_100g') == true
        ? json['nutrition-score-uk_100g'] is String
            ? json['nutrition-score-uk_100g']
            : json['nutrition-score-uk_100g'].toString()
        : null;
    saltServing = json.containsKey('salt_serving') == true
        ? json['salt_serving'] is String
            ? json['salt_serving']
            : json['salt_serving'].toString()
        : null;
    saturatedFatUnit = json.containsKey('saturated-fat_unit') == true
        ? json['saturated-fat_unit'] is String
            ? json['saturated-fat_unit']
            : json['saturated-fat_unit'].toString()
        : null;
    fatValue = json.containsKey('fat_value') == true
        ? json['fat_value'] is String
            ? json['fat_value']
            : json['fat_value'].toString()
        : null;
    saltUnit = json.containsKey('salt_unit') == true
        ? json['salt_unit'] is String
            ? json['salt_unit']
            : json['salt_unit'].toString()
        : null;
    proteins = json.containsKey('proteins') == true
        ? json['proteins'] is String
            ? json['proteins']
            : json['proteins'].toString()
        : null;
    proteins100g = json.containsKey('proteins_100g') == true
        ? json['proteins_100g'] is String
            ? json['proteins_100g']
            : json['proteins_100g'].toString()
        : null;
    carbohydratesServing = json.containsKey('carbohydrates_serving') == true
        ? json['carbohydrates_serving'] is String
            ? json['carbohydrates_serving']
            : json['carbohydrates_serving'].toString()
        : null;
    saturatedFat = json.containsKey('saturated-fat') == true
        ? json['saturated-fat'] is String
            ? json['saturated-fat']
            : json['saturated-fat'].toString()
        : null;
    energyUnit = json.containsKey('energy_unit') == true
        ? json['energy_unit'] is String
            ? json['energy_unit']
            : json['energy_unit'].toString()
        : null;
    fat = json.containsKey('fat') == true
        ? json['fat'] is String ? json['fat'] : json['fat'].toString()
        : null;
    fatServing = json.containsKey('fat_serving') == true
        ? json['fat_serving'] is String
            ? json['fat_serving']
            : json['fat_serving'].toString()
        : null;
    proteinsServing = json.containsKey('proteins_serving') == true
        ? json['proteins_serving'] is String
            ? json['proteins_serving']
            : json['proteins_serving'].toString()
        : null;
    sodiumValue = json.containsKey('sodium_value') == true
        ? json['sodium_value'] is String
            ? json['sodium_value']
            : json['sodium_value'].toString()
        : null;
    saltValue = json.containsKey('salt_value') == true
        ? json['salt_value'] is String
            ? json['salt_value']
            : json['salt_value'].toString()
        : null;
    sugarsValue = json.containsKey('sugars_value') == true
        ? json['sugars_value'] is String
            ? json['sugars_value']
            : json['sugars_value'].toString()
        : null;
    energyValue = json.containsKey('energy_value') == true
        ? json['energy_value'] is String
            ? json['energy_value']
            : json['energy_value'].toString()
        : null;
    sodium100g = json.containsKey('sodium_100g') == true
        ? json['sodium_100g'] is String
            ? json['sodium_100g']
            : json['sodium_100g'].toString()
        : null;
    nutritionScoreUk = json.containsKey('nutrition-score-uk') == true
        ? json['nutrition-score-uk'] is String
            ? json['nutrition-score-uk']
            : json['nutrition-score-uk'].toString()
        : null;
    sodium = json.containsKey('sodium') == true
        ? json['sodium'] is String ? json['sodium'] : json['sodium'].toString()
        : null;
    saturatedFat100g = json.containsKey('saturated-fat_100g') == true
        ? json['saturated-fat_100g'] is String
            ? json['saturated-fat_100g']
            : json['saturated-fat_100g'].toString()
        : null;
    nutritionScoreFr100g = json.containsKey('nutrition-score-fr_100g') == true
        ? json['nutrition-score-fr_100g'] is String
            ? json['nutrition-score-fr_100g']
            : json['nutrition-score-fr_100g'].toString()
        : null;
    carbohydratesValue = json.containsKey('carbohydrates_value') == true
        ? json['carbohydrates_value'] is String
            ? json['carbohydrates_value']
            : json['carbohydrates_value'].toString()
        : null;
    carbohydratesUnit = json.containsKey('carbohydrates_unit') == true
        ? json['carbohydrates_unit'] is String
            ? json['carbohydrates_unit']
            : json['carbohydrates_unit'].toString()
        : null;
    saturatedFatServing = json.containsKey('saturated-fat_serving') == true
        ? json['saturated-fat_serving'] is String
            ? json['saturated-fat_serving']
            : json['saturated-fat_serving'].toString()
        : null;
    sodiumServing = json.containsKey('sodium_serving') == true
        ? json['sodium_serving'] is String
            ? json['sodium_serving']
            : json['sodium_serving'].toString()
        : null;
    proteinsValue = json.containsKey('proteins_value') == true
        ? json['proteins_value'] is String
            ? json['proteins_value']
            : json['proteins_value'].toString()
        : null;
    sugarsUnit = json.containsKey('sugars_unit') == true
        ? json['sugars_unit'] is String
            ? json['sugars_unit']
            : json['sugars_unit'].toString()
        : null;
    sodiumUnit = json.containsKey('sodium_unit') == true
        ? json['sodium_unit'] is String
            ? json['sodium_unit']
            : json['sodium_unit'].toString()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sugars_serving'] = this.sugarsServing;
    data['carbohydrates'] = this.carbohydrates;
    data['salt_100g'] = this.salt100g;
    data['fat_100g'] = this.fat100g;
    data['carbohydrates_100g'] = this.carbohydrates100g;
    data['saturated-fat_value'] = this.saturatedFatValue;
    data['proteins_unit'] = this.proteinsUnit;
    data['salt'] = this.salt;
    data['sugars_100g'] = this.sugars100g;
    data['sugars'] = this.sugars;
    data['energy_serving'] = this.energyServing;
    data['fat_unit'] = this.fatUnit;
    data['energy'] = this.energy;
    data['nutrition-score-fr'] = this.nutritionScoreFr;
    data['energy_100g'] = this.energy100g;
    data['nutrition-score-uk_100g'] = this.nutritionScoreUk100g;
    data['salt_serving'] = this.saltServing;
    data['saturated-fat_unit'] = this.saturatedFatUnit;
    data['fat_value'] = this.fatValue;
    data['salt_unit'] = this.saltUnit;
    data['proteins'] = this.proteins;
    data['proteins_100g'] = this.proteins100g;
    data['carbohydrates_serving'] = this.carbohydratesServing;
    data['saturated-fat'] = this.saturatedFat;
    data['energy_unit'] = this.energyUnit;
    data['fat'] = this.fat;
    data['fat_serving'] = this.fatServing;
    data['proteins_serving'] = this.proteinsServing;
    data['sodium_value'] = this.sodiumValue;
    data['salt_value'] = this.saltValue;
    data['sugars_value'] = this.sugarsValue;
    data['energy_value'] = this.energyValue;
    data['sodium_100g'] = this.sodium100g;
    data['nutrition-score-uk'] = this.nutritionScoreUk;
    data['sodium'] = this.sodium;
    data['saturated-fat_100g'] = this.saturatedFat100g;
    data['nutrition-score-fr_100g'] = this.nutritionScoreFr100g;
    data['carbohydrates_value'] = this.carbohydratesValue;
    data['carbohydrates_unit'] = this.carbohydratesUnit;
    data['saturated-fat_serving'] = this.saturatedFatServing;
    data['sodium_serving'] = this.sodiumServing;
    data['proteins_value'] = this.proteinsValue;
    data['sugars_unit'] = this.sugarsUnit;
    data['sodium_unit'] = this.sodiumUnit;
    return data;
  }

  @override
  String toString() {
    return 'Nutriments{sugarsServing: $sugarsServing, carbohydrates: $carbohydrates, salt100g: $salt100g, fat100g: $fat100g, carbohydrates100g: $carbohydrates100g, saturatedFatValue: $saturatedFatValue, proteinsUnit: $proteinsUnit, salt: $salt, sugars100g: $sugars100g, sugars: $sugars, energyServing: $energyServing, fatUnit: $fatUnit, energy: $energy, nutritionScoreFr: $nutritionScoreFr, energy100g: $energy100g, nutritionScoreUk100g: $nutritionScoreUk100g, saltServing: $saltServing, saturatedFatUnit: $saturatedFatUnit, fatValue: $fatValue, saltUnit: $saltUnit, proteins: $proteins, proteins100g: $proteins100g, carbohydratesServing: $carbohydratesServing, saturatedFat: $saturatedFat, energyUnit: $energyUnit, fat: $fat, fatServing: $fatServing, proteinsServing: $proteinsServing, sodiumValue: $sodiumValue, saltValue: $saltValue, sugarsValue: $sugarsValue, energyValue: $energyValue, sodium100g: $sodium100g, nutritionScoreUk: $nutritionScoreUk, sodium: $sodium, saturatedFat100g: $saturatedFat100g, nutritionScoreFr100g: $nutritionScoreFr100g, carbohydratesValue: $carbohydratesValue, carbohydratesUnit: $carbohydratesUnit, saturatedFatServing: $saturatedFatServing, sodiumServing: $sodiumServing, proteinsValue: $proteinsValue, sugarsUnit: $sugarsUnit, sodiumUnit: $sodiumUnit}';
  }
}
