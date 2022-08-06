import 'package:flutter/material.dart';

class SmallHeadingText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  SmallHeadingText(
      {Key? key,
      this.color = Colors.black54,
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(color: color, fontSize: size, height: height),
    );
  }
}
