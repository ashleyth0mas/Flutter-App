import 'package:get/get.dart';
import 'package:tasty/models/popularproductmodel.dart';
import '../repository/recommendedproductrepo.dart';

class Recommendedproductcontroller extends GetxController {
  final Recommendedproductrepo recommendedproductrepo; //from repository Productrepo

  Recommendedproductcontroller({required this.recommendedproductrepo});
  List<Productsmodel> _recommendedproductlist = [];
  // ignore: non_constant_identifier_names
  List<Productsmodel> get Recommendedproduct_list => _recommendedproductlist;
  bool _isLoaded = false; //loading instance
  bool get isLoaded =>
      _isLoaded;

  get img => null; //get to make private variable(here _isLoaded) to public inorder to access it outside
  Future<void> getRecommendedproductlist() async {
    Response response = await recommendedproductrepo.getProductlist();
    if (response.statusCode == 200) {
      //  print("successfull");
      _recommendedproductlist = [];

      _recommendedproductlist.addAll(Product.fromJson(response.body).productslist);
      _isLoaded = true;
      update();
      // print(_productlist);
    } else {
      print("unsuccesfull");
    }
  }
}
//data is passed to controller as in the form of model object (line 18)
