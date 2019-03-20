import 'package:hfs_flutter_app/models/OpenFoodFacts/Product.dart';
/*import 'package:json_annotation/json_annotation.dart';

part 'OFF_model.g.dart';

@JsonSerializable()*/
class OffObject {
  String statusVerbose;
  Product product;
  int status;
  String code;

  OffObject({this.statusVerbose, this.product, this.status, this.code});

  OffObject.fromJson(Map<String, dynamic> json) {
    statusVerbose = json['status_verbose'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_verbose'] = this.statusVerbose;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }

  @override
  String toString() {
    return 'OFFModel{product: $product}';
  }

}
