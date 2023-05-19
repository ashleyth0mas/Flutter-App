import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty/data/controller/cartcontroller.dart';
import 'package:tasty/models/cartmodel.dart';
import 'package:tasty/models/popularproductmodel.dart';
import 'package:tasty/widgets/colors/colors.dart';

import '../repository/popularproduct_repo.dart';

class Popularproductcontroller extends GetxController {
  final Productrepo productrepo; //from repository Productrepo

  Popularproductcontroller({required this.productrepo});
  List<Productsmodel> _productlist = [];
  // ignore: non_constant_identifier_names
  List<Productsmodel> get Product_list => _productlist;

  bool _isLoaded = false; //loading instance
  late Cartcontroller _cart;
  int _incartitems = 0;

  int _quantity = 0;
  //get incartitems is used to make it access to other classes and this variable gets previous cart quantity& quantity added after.
  int get incartitems => _incartitems + _quantity;
  int get quantity => _quantity;
  bool get isLoaded =>
      _isLoaded; //get to make private variable(here _isLoaded) to public inorder to access it outside

  Future<void> getproductlistcontroller() async {
    Response response = await productrepo.getProductlist();
    if (response.statusCode == 200) {
      //  print("successfull");
      _productlist = [];

      _productlist.addAll(Product.fromJson(response.body).productslist);
      _isLoaded = true;
      update();
      // print(_productlist);
    } else {
      print("unsuccesfull");
    }
  }

  void setQuantity(bool isIncrement, Productsmodel product) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1, product);
    } else {
      _quantity = checkQuantity(_quantity - 1, product);
    }
    update();
  }

  int checkQuantity(int quantity, Productsmodel product) {
    // _incartitems = _cart.getQuantity(product);
    if ((_incartitems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "Oops can't reduce more!!!",
        backgroundColor: Appcolors.maincolor,
        colorText: Colors.white,
      );
      if (_incartitems > 0) {
        quantity = -_incartitems;
        return quantity;
      }
      return 0;
    } else if ((_incartitems + quantity) > 20) {
      Get.snackbar(
        "Item count", "Sorry you can't add more!!!", //popbar thing
        backgroundColor: Appcolors.maincolor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initialState(Productsmodel product, Cartcontroller cart) {
    _quantity = 0;
    _incartitems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existIncart(product);
    // if exist
    print("exist or not=" + exist.toString());
    if (exist) {
      _incartitems = _cart.getQuantity(product);
    }
    print("quantity in cart is:" + _incartitems.toString());
  }

  void additem(Productsmodel product) {
    //if (_quantity > 0) {
    _cart.additems(product, _quantity);
    _quantity = 0;
    _incartitems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("id is" +
          value.id.toString() +
          "quantity is" +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalitems();
  }

  List<Cartmodel> get getitems {
    return _cart.getItems;
  }
}

//data is passed to controller as in the form of model object (line 18)
