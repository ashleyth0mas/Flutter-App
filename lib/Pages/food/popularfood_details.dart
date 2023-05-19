import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty/Pages/cart/cart_page.dart';
import 'package:tasty/data/controller/cartcontroller.dart';

import 'package:tasty/widgets/Iconandtext/icons.dart';
import 'package:tasty/widgets/appconstants.dart';
import 'package:tasty/widgets/apptext/text.dart';
import 'package:tasty/widgets/colors/colors.dart';
import 'package:tasty/widgets/dimensions/dimension.dart';
import 'package:tasty/widgets/introtext/text.dart';

import '../../data/controller/popularproductlist.dart';
import '../../routes/routes.dart';
import '../../widgets/itemrating/itemdetailbox.dart';

// ignore: camel_case_types
class popularfood_details extends StatelessWidget {
  int pageid;
  String page;
  popularfood_details({super.key, required this.pageid, required this.page});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<Popularproductcontroller>()
        .Product_list[pageid]; //to get each list object
    Get.find<Popularproductcontroller>()
        .initialState(product, Get.find<Cartcontroller>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                right: 0,
                left: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.food_detailimgsize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(Appconstants.BASEURL +
                              Appconstants.UPLOADS +
                              product.img!))),
                )),
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (page == "cartpage")
                            Get.toNamed(Routehelper.getcartpage());
                          else {
                            Get.toNamed(Routehelper.getinitial());
                          }
                        },
                        child: icons(
                          icon: Icons.arrow_back_ios,
                        )),
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
                            controller.totalItems >= 1
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
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.food_detailimgsize - 30,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ratedetails(text: product.name!),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Apptext(text: 'Introduce'),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Exptext(text: product.description!)))
                    ],
                  )),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<Popularproductcontroller>(
          builder: (pop_product) {
            return Container(
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
                      child: Row(children: [
                        GestureDetector(
                            onTap: () {
                              pop_product.setQuantity(false, product);
                            },
                            child:
                                Icon(Icons.remove, color: Appcolors.signcolor)),
                        SizedBox(width: Dimensions.width10 / 2),
                        Apptext(text: pop_product.incartitems.toString()),
                        SizedBox(width: Dimensions.width10 / 2),
                        GestureDetector(
                          onTap: () {
                            pop_product.setQuantity(true, product);
                          },
                          child: Icon(
                            Icons.add,
                            color: Appcolors.signcolor,
                          ),
                        )
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: GestureDetector(
                        onTap: () {
                          pop_product.additem(product);
                        },
                        child: Apptext(
                          text: '\$ ${product.price} | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Appcolors.maincolor),
                    )
                  ],
                ));
          },
        ));
  }
}
