import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  Color? color;
  final Color iconColor;
  IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      this.color = AppColors.textColor,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        const SizedBox(width: 5),
        SmallHeadingText(
          text: text,
          color: color,
        )
      ],
    );
  }
}
