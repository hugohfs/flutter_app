class Full {
  String h;
  String w;

  Full({this.h, this.w});

  Full.fromJson(Map<String, dynamic> json) {
    h = json.containsKey('h') == true
        ? json['h'] is String ? json['h'] : json['h'].toString()
        : null;
    w = json.containsKey('w') == true
        ? json['w'] is String ? json['w'] : json['w'].toString()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['h'] = this.h;
    data['w'] = this.w;
    return data;
  }

  @override
  String toString() {
    return 'Full{h: $h, w: $w}';
  }
}
