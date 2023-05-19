import 'package:flutter/cupertino.dart';

class smalltext extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  smalltext({
    super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 20,
    this.height=0
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(height: height,
          fontFamily: 'Roboto', color: color, fontWeight: FontWeight.w400),
    );
  }
}
