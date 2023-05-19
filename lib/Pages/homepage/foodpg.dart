import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty/data/controller/recommendedproductcontroller.dart';
import 'package:tasty/models/popularproductmodel.dart';

import 'package:tasty/widgets/Iconandtext/icontext.dart';
import 'package:tasty/widgets/dimensions/dimension.dart';

import '../../data/controller/popularproductlist.dart';
import '../../routes/routes.dart';
import '../../widgets/appconstants.dart';
import '../../widgets/apptext/text.dart';
import '../../widgets/apptext/smalltext.dart';
import '../../widgets/colors/colors.dart';

class Foodpg extends StatefulWidget {
  const Foodpg({super.key});

  @override
  State<Foodpg> createState() => _FoodpgState();
}

class _FoodpgState extends State<Foodpg> {
  //PageController pgcontrol;                                       //object of PageController
  PageController pgcontrol = PageController(viewportFraction: 0.85);
  var currpagevalue = 0.0;
  double scaleFactor = 0.8;
  var height = 220;
  @override
  void initState() {
    super.initState();
    pgcontrol.addListener(() {
      setState(() {
        currpagevalue = pgcontrol.page!;
        //pgcontrol.page- returns current page value of the slide
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pgcontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<Popularproductcontroller>(builder: (pop_products) {
          //pop_product=object referring to instances of controller
          return pop_products.isLoaded
              ? Container(
                  color: Colors.white,
                  height: Dimensions.pageview,
                  child: PageView.builder(
                      controller: pgcontrol,
                      // controller: PageController(viewportFraction: 0.85),
                      itemCount: pop_products.Product_list.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position,
                            pop_products.Product_list[
                                position]); //pop_products.Product_list[position]=each list object
                        //position=index
                      }),
                )
              : CircularProgressIndicator(
                  //for loading
                  color: Appcolors.maincolor,
                );
        }),
        GetBuilder<Popularproductcontroller>(builder: (pop_products) {
          return DotsIndicator(
            dotsCount: pop_products.Product_list.isEmpty
                ? 1
                : pop_products.Product_list.length,
            position: currpagevalue,
            decorator: DotsDecorator(
              activeColor: Appcolors.maincolor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Apptext(text: 'Recommended'),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Apptext(text: '.', color: Colors.black26)),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: smalltext(text: 'Food Pairing'))
            ],
          ),
        ),
        GetBuilder<Recommendedproductcontroller>(builder: (rec_products) {
          return rec_products.isLoaded ?ListView.builder(
              itemCount: rec_products.Recommendedproduct_list.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routehelper.getrecommendedfood(index,"home"));
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.width10),
                      child: Row(
                        children: [
                          Container(
                            height: Dimensions.listimagesize,
                            width: Dimensions.listimagesize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(Appconstants.BASEURL+Appconstants.UPLOADS+rec_products.Recommendedproduct_list[index].img!),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                height: Dimensions.listimagetextsize,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                padding: EdgeInsets.only(
                                    top: Dimensions.height10,
                                    left: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Apptext(text: rec_products.Recommendedproduct_list[index].name!),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Expanded(child: smalltext(text:  rec_products.Recommendedproduct_list[index].description!)),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      children: [
                                        Icontext(
                                          icon: Icons.circle_sharp,
                                          text: 'Normal',
                                          iconcolor: Appcolors.icon1,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width5,
                                        ),
                                        Icontext(
                                            icon: Icons.location_on,
                                            text: '5km',
                                            iconcolor: Appcolors.maincolor),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        Icontext(
                                            icon: Icons.access_time_rounded,
                                            text: '45min',
                                            iconcolor: Appcolors.icon2),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )),
                );
              }):CircularProgressIndicator(
                color: Appcolors.maincolor,
              );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, Productsmodel popularproduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == currpagevalue.floor()) {
      var currscale = 1 - (currpagevalue - index) * (1 - scaleFactor);

      var currtrans = height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currpagevalue.floor() + 1) {
      var currscale =
          scaleFactor + (currpagevalue - index + 1) * (1 - scaleFactor);

      var currtrans = height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currpagevalue.floor() - 1) {
      var currscale = 1 - (currpagevalue - index) * (1 - scaleFactor);

      var currtrans = height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else {
      var currscale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, height * (1 - currscale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routehelper.getpopularfood(index,"home")); //for each product description,calling the function, getpopularfood(index)
          },
          child: Container(
            height: Dimensions.pageviewcontainer,
            margin: EdgeInsets.only(left: 10, right: 10, top: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(Appconstants.BASEURL +
                        Appconstants.UPLOADS +
                        popularproduct.img!))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: Dimensions.pagetextcontainer,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 45, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                //Container for providing padding
                padding: EdgeInsets.only(
                    top: Dimensions.padtop15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Apptext(text: popularproduct.name!),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(5, (index) {
                          return (Icon(
                            Icons.star,
                            color: Appcolors.maincolor,
                            size: 15,
                          ));
                        })),
                        const SizedBox(
                          width: 10,
                        ),
                        smalltext(text: '4.5'),
                        const SizedBox(
                          width: 10,
                        ),
                        smalltext(text: '1287'),
                        SizedBox(width: 10),
                        smalltext(text: 'comments')
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icontext(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconcolor: Appcolors.icon1),
                        Icontext(
                            icon: Icons.location_on,
                            text: '1.7km',
                            iconcolor: Appcolors.maincolor),
                        Icontext(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconcolor: Appcolors.icon2),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
