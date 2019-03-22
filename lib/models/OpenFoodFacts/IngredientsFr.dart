import 'package:hfs_flutter_app/models/OpenFoodFacts/Sizes.dart';

class IngredientsFr {
  String y2;
  String x1;
  String angle;
  String whiteMagic;
  String imgid;
  String normalize;
  String y1;
  String x2;
  String rev;
  Sizes sizes;
  String geometry;

  IngredientsFr(
      {this.y2,
      this.x1,
      this.angle,
      this.whiteMagic,
      this.imgid,
      this.normalize,
      this.y1,
      this.x2,
      this.rev,
      this.sizes,
      this.geometry});

  IngredientsFr.fromJson(Map<String, dynamic> json) {
    y2 = json.containsKey('y2') == true
        ? json['y2'] is String ? json['y2'] : json['y2'].toString()
        : null;
    x1 = json.containsKey('x1') == true
        ? json['x1'] is String ? json['x1'] : json['x1'].toString()
        : null;
    angle = json.containsKey('angle') == true
        ? json['angle'] is String ? json['angle'] : json['angle'].toString()
        : null;
    whiteMagic = json.containsKey('white_magic') == true
        ? json['white_magic'] is String
            ? json['white_magic']
            : json['white_magic'].toString()
        : null;
    imgid = json.containsKey('imgid') == true
        ? json['imgid'] is String ? json['imgid'] : json['imgid'].toString()
        : null;
    normalize = json.containsKey('normalize') == true
        ? json['normalize'] is String
            ? json['normalize']
            : json['normalize'].toString()
        : null;
    y1 = json.containsKey('y1') == true
        ? json['y1'] is String ? json['y1'] : json['y1'].toString()
        : null;
    x2 = json.containsKey('x2') == true
        ? json['x2'] is String ? json['x2'] : json['x2'].toString()
        : null;
    rev = json.containsKey('rev') == true
        ? json['rev'] is String ? json['rev'] : json['rev'].toString()
        : null;
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    geometry = json.containsKey('geometry') == true
        ? json['geometry'] is String
            ? json['geometry']
            : json['geometry'].toString()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['y2'] = this.y2;
    data['x1'] = this.x1;
    data['angle'] = this.angle;
    data['white_magic'] = this.whiteMagic;
    data['imgid'] = this.imgid;
    data['normalize'] = this.normalize;
    data['y1'] = this.y1;
    data['x2'] = this.x2;
    data['rev'] = this.rev;
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    data['geometry'] = this.geometry;
    return data;
  }

  @override
  String toString() {
    return 'IngredientsFr{y2: $y2, x1: $x1, angle: $angle, whiteMagic: $whiteMagic, imgid: $imgid, normalize: $normalize, y1: $y1, x2: $x2, rev: $rev, sizes: $sizes, geometry: $geometry}';
  }
}
