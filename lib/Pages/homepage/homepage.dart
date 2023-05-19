import 'package:flutter/material.dart';
import 'package:tasty/widgets/apptext/smalltext.dart';
import 'package:tasty/widgets/colors/colors.dart';
import 'package:tasty/widgets/dimensions/dimension.dart';

import '../../widgets/apptext/text.dart';
import 'foodpg.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          
      Container(
        margin: const EdgeInsets.only(top: 45),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Column(
              children:  [
                Apptext(text:'Kochi',color: Appcolors.maincolor),
                Row(children: [
                smalltext(text:"India",color:Colors.black54),
                Icon(Icons.arrow_drop_down_rounded)
                ],)
                ,],
            ),
            Container(
              height: 45,
              width: 45,
               child:Icon(Icons.search, color: Colors.white),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: Appcolors.maincolor),
            )
          ],
        ),
      ),
      const Expanded(child:SingleChildScrollView(
      child:Foodpg(),))
      
    ]),

    );
  }
}
