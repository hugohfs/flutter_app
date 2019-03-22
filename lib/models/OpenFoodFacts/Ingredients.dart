class Ingredients {
  String percent;
  String rank;
  String id;
  String text;

  Ingredients({this.percent, this.rank, this.id, this.text});

  Ingredients.fromJson(Map<String, dynamic> json) {
    percent = json.containsKey('rank') == true ? json['rank'] : null;
    rank = json.containsKey('rank') == true
        ? json['rank'] is String ? json['rank'] : json['rank'].toString()
        : null;
    id = json.containsKey('id') == true ? json['id'] : null;
    text = json.containsKey('text') == true ? json['text'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percent'] = this.percent;
    data['rank'] = this.rank;
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }

  @override
  String toString() {
    return 'Ingredients{percent: $percent, rank: $rank, id: $id, text: $text}';
  }
}
