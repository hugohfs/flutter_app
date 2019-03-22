import 'package:hfs_flutter_app/models/OpenFoodFacts/FrontFr.dart';
import 'package:hfs_flutter_app/models/OpenFoodFacts/IngredientsFr.dart';
import 'package:hfs_flutter_app/models/OpenFoodFacts/NutritionFr.dart';

class Images {
  FrontFr frontFr;
  NutritionFr nutritionFr;
  IngredientsFr ingredientsFr;

  Images({this.frontFr, this.nutritionFr, this.ingredientsFr});

  Images.fromJson(Map<String, dynamic> json) {
    frontFr = json['front_fr'] != null
        ? new FrontFr.fromJson(json['front_fr'])
        : null;
    nutritionFr = json['nutrition_fr'] != null
        ? new NutritionFr.fromJson(json['nutrition_fr'])
        : null;
    ingredientsFr = json['ingredients_fr'] != null
        ? new IngredientsFr.fromJson(json['ingredients_fr'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.frontFr != null) {
      data['front_fr'] = this.frontFr.toJson();
    }
    if (this.nutritionFr != null) {
      data['nutrition_fr'] = this.nutritionFr.toJson();
    }
    if (this.ingredientsFr != null) {
      data['ingredients_fr'] = this.ingredientsFr.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Images{frontFr: $frontFr, nutritionFr: $nutritionFr, ingredientsFr: $ingredientsFr}';
  }
}