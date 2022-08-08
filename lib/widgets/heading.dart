import 'package:flutter/material.dart';
import 'package:gursha/util/dimensions.dart';

class HeadingText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  HeadingText(
      {Key? key,
      this.color = Colors.black87,
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.bold),
    );
  }
}
