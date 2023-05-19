import 'package:flutter/cupertino.dart';
import 'package:tasty/widgets/dimensions/dimension.dart';

class Apptext extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow overflow;
  Apptext({super.key
  ,this.color=const Color(0xFF332d2b),
  required this.text,
  this.size=0,
  this.overflow=TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color:color,
        fontSize: size==0?Dimensions.fontsize20:size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
