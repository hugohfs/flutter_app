import 'package:hfs_flutter_app/models/OpenFoodFacts/Full.dart';

class Sizes {
  Full full;

  Sizes({this.full});

  Sizes.fromJson(Map<String, dynamic> json) {
    full = json['full'] != null ? new Full.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.full != null) {
      data['full'] = this.full.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Sizes{full: $full}';
  }
}