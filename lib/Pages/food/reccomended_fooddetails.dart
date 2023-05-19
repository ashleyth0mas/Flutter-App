import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty/Pages/cart/cart_page.dart';
import 'package:tasty/data/controller/cartcontroller.dart';
import 'package:tasty/data/controller/popularproductlist.dart';
import 'package:tasty/data/controller/recommendedproductcontroller.dart';

import 'package:tasty/routes/routes.dart';
import 'package:tasty/widgets/appconstants.dart';
import 'package:tasty/widgets/apptext/text.dart';
import 'package:tasty/widgets/colors/colors.dart';
import 'package:tasty/widgets/dimensions/dimension.dart';
import 'package:tasty/widgets/introtext/text.dart';

import '../../widgets/Iconandtext/icons.dart';

// ignore: camel_case_types
class food_info extends StatelessWidget {
  final int pageid;
  String page;
  food_info({super.key, required this.pageid, required this.page});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<Recommendedproductcontroller>()
        .Recommendedproduct_list[pageid];
    Get.find<Popularproductcontroller>()
        .initialState(product, Get.find<Cartcontroller>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartpage") {
                          Get.toNamed(Routehelper.cartpage);
                        } else {
                          Get.toNamed(Routehelper.getinitial());
                        }
                      },
                      child: icons(icon: Icons.clear)),
                  GetBuilder<Popularproductcontroller>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1)
                          Get.toNamed(Routehelper.getcartpage());
                      },
                      child: Stack(
                        children: [
                          icons(
                            icon: Icons.shopping_cart_outlined,
                          ),
                          Get.find<Popularproductcontroller>().totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: icons(
                                      icon: Icons.circle,
                                      containersize: 20,
                                      iconcolor: Colors.transparent,
                                      bgcolor: Appcolors.maincolor))
                              : Container(),
                          Positioned(
                              right: 4.5,
                              top: 3,
                              child: Apptext(
                                text: controller.totalItems.toString(),
                                color: Colors.white,
                                size: 12,
                              ))
                        ],
                      ),
                    );
                  })
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            topRight: Radius.circular(Dimensions.radius20),
                          )),
                      padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10),
                      width: double.maxFinite,
                      child: Center(
                          child: Apptext(
                              size: Dimensions.fontsize26,
                              text: product.name!)))),
              pinned: true,
              backgroundColor: Color.fromARGB(255, 85, 161, 148),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                //content inside flexiblespace
                background: Image.network(
                  Appconstants.BASEURL + Appconstants.UPLOADS + product.img!,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width10),
                    child: Exptext(text: product.description!))
              ],
            ))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<Popularproductcontroller>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false, product);
                        print("removed product id" + product.id.toString());
                      },
                      child: icons(
                          iconsize: Dimensions.iconsize24,
                          iconcolor: Colors.white,
                          bgcolor: Appcolors.maincolor,
                          icon: Icons.remove),
                    ),
                    Apptext(
                        size: Dimensions.fontsize26,
                        color: Appcolors.blackcolor,
                        text:
                            '\$ ${product.price}  X  ${controller.incartitems} '),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true, product);
                        print("added product id " + product.id.toString());
                      },
                      child: icons(
                          iconsize: Dimensions.iconsize24,
                          iconcolor: Colors.white,
                          bgcolor: Appcolors.maincolor,
                          icon: Icons.add),
                    )
                  ],
                ),
              ),
              Container(
                  height: Dimensions.navbarht,
                  padding: EdgeInsets.only(
                      top: Dimensions.height30,
                      bottom: Dimensions.height30,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      color: Appcolors.navbarcolor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20 * 2),
                        topRight: Radius.circular(Dimensions.radius20 * 2),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white),
                          child: icons(
                            icon: Icons.favorite,
                            iconcolor: Appcolors.maincolor,
                            bgcolor: Colors.white,
                          )),
                      GestureDetector(
                        onTap: () {
                          controller.additem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          child: Apptext(
                            text: '\$ ${product.price} | Add to cart',
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Appcolors.maincolor),
                        ),
                      )
                    ],
                  )),
            ],
          );
        }));
  }
}
