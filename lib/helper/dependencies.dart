import 'package:get/get.dart';
import 'package:tasty/data/api/apiclient.dart';
import 'package:tasty/data/controller/popularproductlist.dart';
import 'package:tasty/widgets/appconstants.dart';


import '../data/controller/cartcontroller.dart';
import '../data/controller/recommendedproductcontroller.dart';
import '../data/repository/cartrepo.dart';
import '../data/repository/popularproduct_repo.dart';
import '../data/repository/recommendedproductrepo.dart';

Future<void> init() async {
  //apiclient
  Get.lazyPut(() => apiclient(appUrl: Appconstants.BASEURL));
  //repos
  Get.lazyPut(() => Productrepo(Apiclient: Get.find()));
    Get.lazyPut(() => Recommendedproductrepo(Apiclient: Get.find()));
    Get.lazyPut(() => Cartrepo());
  //controller
  Get.lazyPut(() => Popularproductcontroller(productrepo: Get.find()));
  Get.lazyPut(() => Recommendedproductcontroller(recommendedproductrepo: Get.find()));
Get.lazyPut(() => Cartcontroller(cartrepo:Get.find()));

}
