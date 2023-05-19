import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty/Pages/cart/cart_page.dart';
import 'package:tasty/data/controller/popularproductlist.dart';

import 'package:tasty/helper/dependencies.dart' as dep;
import 'data/controller/recommendedproductcontroller.dart';
import 'routes/routes.dart';
import 'Pages/homepage/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //syntax to call controller
    Get.find<Popularproductcontroller>().getproductlistcontroller();
     Get.find<Recommendedproductcontroller>().getRecommendedproductlist();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Homepage(),
      initialRoute: Routehelper.getinitial(),
      getPages: Routehelper.routes,
    );
  }
}
