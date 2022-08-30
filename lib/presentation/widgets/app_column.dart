import 'package:flutter/material.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/icon_and_text.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class AppColumn extends StatelessWidget {
  final String title;
  final double size;
  final double containerHeight;
  final double radius;
  final double padding;
  final double spacing;
  final double ratingIconSize;
  final double iconSize;

  const AppColumn(
      {Key? key,
      required this.title,
      required this.size,
      required this.containerHeight,
      required this.radius,
      required this.padding,
      required this.spacing,
      required this.ratingIconSize,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
          color: Colors.white),
      child: Padding(
          padding: EdgeInsets.only(left: padding, right: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(text: title, size: size),
              SizedBox(
                height: spacing,
              ),
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: ratingIconSize,
                        )),
              ),
              SizedBox(
                height: spacing,
              ),
              SmallHeadingText(
                  text:
                      'Rich meals, also having that taste you won\'t find anywhere'),
              SizedBox(
                height: spacing,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconAndText(
                    icon: Icons.circle_sharp,
                    text: 'Normal',
                    iconColor: AppColors.mainColor,
                    size: iconSize,
                  ),
                  IconAndText(
                    icon: Icons.timer_sharp,
                    text: '10 mins',
                    iconColor: AppColors.textColor,
                    size: iconSize,
                  ),
                  IconAndText(
                    icon: Icons.location_on,
                    text: '1 Km',
                    iconColor: AppColors.iconColor1,
                    size: iconSize,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
