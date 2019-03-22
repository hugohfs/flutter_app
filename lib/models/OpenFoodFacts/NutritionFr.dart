import 'package:hfs_flutter_app/models/OpenFoodFacts/Sizes.dart';

class NutritionFr {
  String y1;
  String normalize;
  String x2;
  String rev;
  String geometry;
  Sizes sizes;
  String y2;
  String x1;
  String angle;
  String whiteMagic;
  String imgid;

  NutritionFr(
      {this.y1,
        this.normalize,
        this.x2,
        this.rev,
        this.geometry,
        this.sizes,
        this.y2,
        this.x1,
        this.angle,
        this.whiteMagic,
        this.imgid});

  NutritionFr.fromJson(Map<String, dynamic> json) {
    y1 = json['y1'];
    normalize = json['normalize'];
    x2 = json['x2'];
    rev = json['rev'];
    geometry = json['geometry'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    y2 = json['y2'];
    x1 = json['x1'];
    angle = json['angle'];
    whiteMagic = json['white_magic'];
    imgid = json['imgid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['y1'] = this.y1;
    data['normalize'] = this.normalize;
    data['x2'] = this.x2;
    data['rev'] = this.rev;
    data['geometry'] = this.geometry;
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    data['y2'] = this.y2;
    data['x1'] = this.x1;
    data['angle'] = this.angle;
    data['white_magic'] = this.whiteMagic;
    data['imgid'] = this.imgid;
    return data;
  }

  @override
  String toString() {
    return 'NutritionFr{y1: $y1, normalize: $normalize, x2: $x2, rev: $rev, geometry: $geometry, sizes: $sizes, y2: $y2, x1: $x1, angle: $angle, whiteMagic: $whiteMagic, imgid: $imgid}';
  }
}