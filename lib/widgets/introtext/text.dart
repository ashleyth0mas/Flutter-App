import 'package:flutter/material.dart';

import 'package:tasty/widgets/apptext/smalltext.dart';
import 'package:tasty/widgets/colors/colors.dart';

import '../dimensions/dimension.dart';

class Exptext extends StatefulWidget {
  final String text;

  const Exptext({super.key, required this.text});

  @override
  State<Exptext> createState() => _ExptextState();
}

class _ExptextState extends State<Exptext> {
  late String firsthalf;
  late String secondhalf;
  bool hiddentext = true;
  double textheight = Dimensions.screenheight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      firsthalf = widget.text.substring(0, textheight.toInt());
      secondhalf =
          widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondhalf.isEmpty ? smalltext(text: firsthalf,size:Dimensions.fontsize16,color:Appcolors.paracolor)
           
            : Column(
                children: [
                  smalltext( size:Dimensions.fontsize16,color:Appcolors.paracolor,height: 1.8,
                      text: hiddentext? (firsthalf + '...') : (firsthalf + secondhalf),),
                        
                    InkWell(onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;    //toggle value of hiddentext
                    });
                  },
                 child: Row(
                children: [
                  smalltext(text:hiddentext? 'Show More':'Show less',color:Appcolors.maincolor),
                  Icon(hiddentext?Icons.arrow_drop_down:Icons.arrow_drop_up,color:Appcolors.maincolor)
                ],
                 ), 
                  )
                ],
              ));
  }
}
