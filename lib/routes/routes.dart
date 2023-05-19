import 'package:get/get.dart';
import 'package:tasty/Pages/cart/cart_page.dart';
import 'package:tasty/Pages/food/popularfood_details.dart';
import 'package:tasty/Pages/food/reccomended_fooddetails.dart';
import 'package:tasty/Pages/homepage/homepage.dart';

class Routehelper {
  static const String initial = "/";
  static const String popularfood = "/popular-food";
  static const String recommendedfood = "/recommended-food";
  static const String cartpage = "/cartpage";

  static String getinitial() => '$initial';
  static String getpopularfood(int pageId,String page) => '$popularfood?pageid=$pageId&page=$page';
  static String getrecommendedfood(int pageId,String page) =>
      '$recommendedfood?pageid=$pageId&page=$page';
      static String getcartpage() => '$cartpage';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return Homepage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: popularfood,
        page: () {
          var pageID = Get.parameters['pageid'];
          var page = Get.parameters['page'];
          return popularfood_details(
            pageid: int.parse(pageID!,
            ), page: page!,
          ); 
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedfood,
        page: () {
          var pageID = Get.parameters['pageid'];
          var page = Get.parameters['page'];
          return food_info(pageid: int.parse(pageID!),page: page!,);
        },
        transition: Transition.fadeIn),
       GetPage(
        name: cartpage,
        page: () {
          
          return CartPage( );
        },
        transition: Transition.fadeIn),  
  ];
}
