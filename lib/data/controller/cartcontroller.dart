import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tasty/models/cartmodel.dart';
import 'package:tasty/models/popularproductmodel.dart';

import '../../widgets/colors/colors.dart';
import '../repository/cartrepo.dart';

class Cartcontroller extends GetxController {
  final Cartrepo cartrepo;
  Cartcontroller({required this.cartrepo});
  Map<int, Cartmodel> items = {};
  void additems(Productsmodel product, int quantity) {
    var totquantity = 0;
    if (items.containsKey(product.id)) {
      items.update(product.id!, (value) {
        //product= value,product.id=key
        totquantity = value.quantity! + quantity;
        return Cartmodel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: value.quantity! + quantity,
            time: DateTime.now().toString(),
            isExist: true,
            product: product);
      });
      if (totquantity <= 0) {
        items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        items.putIfAbsent(product.id!, () {
          /* print("adding item to cart " +
          product.id!.toString() +
          " quantities" +
          quantity.toString());
      items.forEach((key, value) {
        print("quantity is" + value.quantity.toString());
      });*/
          return Cartmodel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              time: DateTime.now().toString(),
              isExist: true,
              product: product);
        });
      } else {
        Get.snackbar(
          "Item count",
          "You should add atleast one item!!!",
          backgroundColor: Appcolors.maincolor,
          colorText: Colors.white,
        );
      }
    }
    update();
  }

  bool existIncart(Productsmodel product) {
    if (items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(Productsmodel product) {
    var quantity = 0;
    if (items.containsKey(product.id!)) {
      items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int totalitems() {
    var totalquantity = 0;
    items.forEach((key, value) {
      totalquantity += value.quantity!;
    });
    return totalquantity;
  }

  List<Cartmodel> get getItems {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int totalamt() {
    int total = 0;
    getItems.forEach(( value) {                             //can either loop through getItems or items
      total += value.price! * value.quantity!;
    });
    return total;
  }
}
//mapname.entries.map((e{}))=to return each key value pair 