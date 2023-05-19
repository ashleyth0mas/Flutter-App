import 'package:tasty/models/popularproductmodel.dart';

class Cart {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<Cartmodel> _products;
  List<Cartmodel> get productslist =>
      _products; 

  Cart(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
   
  }

  Cart.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <Cartmodel>[];
      json['products'].forEach((v) {
        _products
            .add(Cartmodel.fromJson(v));
      });
    }
  }
}

class Cartmodel {
  int? id;
  String? name;
  int? price;
  bool? isExist;
  String? img;
  int? quantity;
  String? time;
  Productsmodel? product;
  Cartmodel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.time,
      this.isExist,
      this.product});

  Cartmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    price = json['price'];

    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    product = Productsmodel.fromJson(json[product]);
  }
}
