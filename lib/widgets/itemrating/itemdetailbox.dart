import 'package:flutter/material.dart';

import '../Iconandtext/icontext.dart';
import '../apptext/smalltext.dart';
import '../apptext/text.dart';
import '../colors/colors.dart';
import '../dimensions/dimension.dart';

class ratedetails extends StatelessWidget {
  final String text;
  const ratedetails({super.key,
  required this.text
  }
  );

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Apptext(text: text,size: Dimensions.fontsize26,),
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
    );
  }
}