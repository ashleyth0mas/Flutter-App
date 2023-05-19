import 'package:flutter/cupertino.dart';



class icons extends StatelessWidget {
  final IconData icon;
  final Color iconcolor;
  final Color bgcolor;
  final double containersize;
  final double iconsize;
  const icons({super.key,
   required this.icon,
    this.iconcolor = const Color(0xFF756d54),
    this.bgcolor=const Color(0xFFfcf4e4),
    this.containersize=40,
     this.iconsize=16
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containersize,
      width: containersize,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(containersize/2),
        color: bgcolor
      ) ,
      child:Icon(
icon,
color:iconcolor ,
size: iconsize,


      )
    );
  }
}
