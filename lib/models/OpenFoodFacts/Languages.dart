class Languages {
  String enFrench;

  Languages({this.enFrench});

  Languages.fromJson(Map<String, dynamic> json) {
    enFrench = json.containsKey('en:french') == true
        ? json['en:french'] is String
        ? json['en:french']
        : json['en:french'].toString()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en:french'] = this.enFrench;
    return data;
  }

  @override
  String toString() {
    return 'Languages{enFrench: $enFrench}';
  }
}