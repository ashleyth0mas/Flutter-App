import 'package:flutter/cupertino.dart';
import 'package:tasty/widgets/apptext/smalltext.dart';
import 'package:tasty/widgets/dimensions/dimension.dart';

class Icontext extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;
  final double iconsize;
  const Icontext(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconcolor,
      this.iconsize=24});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconcolor,
          size: Dimensions.iconsize24,
        ),
        SizedBox(width: Dimensions.width5),
        smalltext(text: text),
      ],
    );
  }
}
