import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty/Pages/food/popularfood_details.dart';
import 'package:tasty/data/controller/cartcontroller.dart';
import 'package:tasty/data/controller/popularproductlist.dart';
import 'package:tasty/widgets/Iconandtext/icons.dart';
import 'package:tasty/widgets/appconstants.dart';
import 'package:tasty/widgets/apptext/smalltext.dart';
import 'package:tasty/widgets/apptext/text.dart';
import 'package:tasty/widgets/colors/colors.dart';
import 'package:tasty/widgets/dimensions/dimension.dart';

import '../../data/controller/recommendedproductcontroller.dart';
import '../../routes/routes.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routehelper.getinitial());
                    },
                    child: icons(
                      icon: Icons.arrow_back_ios,
                      iconcolor: Colors.white,
                      bgcolor: Appcolors.maincolor,
                      iconsize: Dimensions.iconsize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routehelper.getinitial());
                    },
                    child: icons(
                      icon: Icons.home_outlined,
                      iconcolor: Colors.white,
                      bgcolor: Appcolors.maincolor,
                      iconsize: Dimensions.iconsize24,
                    ),
                  ),
                  icons(
                    icon: Icons.shopping_cart,
                    iconcolor: Colors.white,
                    bgcolor: Appcolors.maincolor,
                    iconsize: Dimensions.iconsize24,
                  ),
                ],
              ),
            )),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    color: Colors.white,
                    child: MediaQuery.removePadding(
                      //mediaquery.remove padding=to remove default padding of listview builder
                      context: context,
                      removeTop: true,
                      child:
                          GetBuilder<Cartcontroller>(builder: (cartcontroller) {
                        var _cartlist = cartcontroller.getItems;
                        return ListView.builder(
                            itemCount: _cartlist.length,
                            itemBuilder: (_, index) {
                              return Container(
                                  color: Colors.white,
                                  height: Dimensions.height20 * 5,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height45),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularindex = Get.find<
                                                  Popularproductcontroller>()
                                              .Product_list
                                              .indexOf(_cartlist[index]
                                                  .product!); //to get the popular product index from popularproduct list(Product_list),we use indexOf(product object)
                                          if (popularindex >= 0) {
                                            Get.toNamed(
                                                Routehelper.getpopularfood(
                                                    popularindex, "cartpage"));
                                          } else {
                                            var recommendedindex = Get.find<
                                                    Recommendedproductcontroller>()
                                                .Recommendedproduct_list
                                                .indexOf(_cartlist[index]
                                                    .product!); //to get the recommended product index from recommendedproduct list(Product_list),we use indexOf(product object)
                                            if (recommendedindex >= 0) {
                                              Get.toNamed(Routehelper
                                                  .getrecommendedfood(
                                                      recommendedindex,
                                                      "cartpage"));
                                            }
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: Dimensions.height10),
                                          width: Dimensions.height20 * 5,
                                          height: Dimensions.height20 * 5,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      Appconstants.BASEURL +
                                                          Appconstants.UPLOADS +
                                                          cartcontroller
                                                              .getItems[index]
                                                              .img!)),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20)),
                                        ),
                                      ),
                                      SizedBox(width: Dimensions.width10),
                                      Expanded(
                                          child: Container(
                                              height: Dimensions.height20 * 5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Apptext(
                                                    text:
                                                        _cartlist[index].name!,
                                                    color: Colors.black54,
                                                  ),
                                                  smalltext(text: 'Spicy'),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Apptext(
                                                        text: "\$" +
                                                            cartcontroller
                                                                .getItems[index]
                                                                .price!
                                                                .toString(),
                                                        color: Colors.redAccent,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            top: Dimensions
                                                                .height10,
                                                            bottom: Dimensions
                                                                .height10,
                                                            left: Dimensions
                                                                .width20,
                                                            right: Dimensions
                                                                .width20),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    Dimensions
                                                                        .radius20),
                                                            color:
                                                                Colors.white),
                                                        child: Row(children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                cartcontroller.additems(
                                                                    _cartlist[
                                                                            index]
                                                                        .product!,
                                                                    -1);
                                                              },
                                                              child: Icon(
                                                                  Icons.remove,
                                                                  color: Appcolors
                                                                      .signcolor)),
                                                          SizedBox(
                                                              width: Dimensions
                                                                      .width10 /
                                                                  2),
                                                          Apptext(
                                                              text: _cartlist[
                                                                      index]
                                                                  .quantity
                                                                  .toString()),
                                                          SizedBox(
                                                              width: Dimensions
                                                                      .width10 /
                                                                  2),
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartcontroller.additems(
                                                                  _cartlist[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Appcolors
                                                                  .signcolor,
                                                            ),
                                                          )
                                                        ]),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )))
                                    ],
                                  ));
                            });
                      }),
                    )))
          ],
        ),
        bottomNavigationBar: GetBuilder<Cartcontroller>(
          builder: (cartcontroller) {
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
                        SizedBox(width: Dimensions.width10 / 2),
                        Apptext(
                            text: "\$ " + cartcontroller.totalamt().toString()),
                        SizedBox(width: Dimensions.width10 / 2),
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
                          //    pop_product.additem(product);
                        },
                        child: Apptext(
                          text: 'Checkout',
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
