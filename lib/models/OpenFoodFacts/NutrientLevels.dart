class NutrientLevels {
  String saturatedFat;
  String salt;
  String fat;
  String sugars;

  NutrientLevels({this.saturatedFat, this.salt, this.fat, this.sugars});

  NutrientLevels.fromJson(Map<String, dynamic> json) {
    saturatedFat = json['saturated-fat'];
    salt = json['salt'];
    fat = json['fat'];
    sugars = json['sugars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saturated-fat'] = this.saturatedFat;
    data['salt'] = this.salt;
    data['fat'] = this.fat;
    data['sugars'] = this.sugars;
    return data;
  }

  @override
  String toString() {
    return 'NutrientLevels{saturatedFat: $saturatedFat, salt: $salt, fat: $fat, sugars: $sugars}';
  }
}