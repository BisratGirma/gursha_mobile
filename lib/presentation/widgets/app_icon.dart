import 'package:flutter/cupertino.dart';
import 'package:gursha/presentation/util/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  final double size;
  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color.fromARGB(146, 240, 240, 240),
      this.iconColor = const Color.fromARGB(226, 61, 61, 61),
      this.size = 40,
      this.iconSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize == 0 ? Dimensions.iconSize16 : iconSize,
      ),
    );
  }
}
