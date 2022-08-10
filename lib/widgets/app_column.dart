import 'package:flutter/material.dart';
import 'package:gursha/util/colors.dart';
import 'package:gursha/util/dimensions.dart';
import 'package:gursha/widgets/heading.dart';
import 'package:gursha/widgets/icon_and_text.dart';
import 'package:gursha/widgets/small_heading.dart';

class AppColumn extends StatelessWidget {
  final String title;
  final double size;
  const AppColumn({Key? key, required this.title, this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.listViewTextContainer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20),
              bottomRight: Radius.circular(Dimensions.radius20)),
          color: Colors.white),
      child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(text: title, size: size),
              SizedBox(
                height: Dimensions.height10,
              ),
              SmallHeadingText(
                  text:
                      'Rich meals, also having that taste you won\'t find anywhere'),
              SizedBox(
                height: Dimensions.height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconAndText(
                      icon: Icons.circle_sharp,
                      text: 'Normal',
                      iconColor: AppColors.mainColor),
                  IconAndText(
                      icon: Icons.timer_sharp,
                      text: '10 mins',
                      iconColor: AppColors.textColor),
                  IconAndText(
                      icon: Icons.location_on,
                      text: '1 Km',
                      iconColor: AppColors.iconColor1)
                ],
              ),
            ],
          )),
    );
  }
}
