import 'package:flutter/material.dart';
import 'package:gursha/presentation/util/dimensions.dart';

class HeadingText extends StatelessWidget {
  Color? color;
  final String text;
  final double size;
  TextOverflow overflow;
  HeadingText(
      {Key? key,
      this.color = Colors.black87,
      required this.text,
      required this.size,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
