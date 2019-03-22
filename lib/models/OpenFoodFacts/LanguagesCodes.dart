class LanguagesCodes {
  String fr;

  LanguagesCodes({this.fr});

  LanguagesCodes.fromJson(Map<String, dynamic> json) {
    fr = json.containsKey('fr') == true
        ? json['fr'] is String
        ? json['fr']
        : json['fr'].toString()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fr'] = this.fr;
    return data;
  }

  @override
  String toString() {
    return 'LanguagesCodes{fr: $fr}';
  }
}