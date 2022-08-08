import 'package:flutter/material.dart';
import 'package:gursha/util/colors.dart';
import 'package:gursha/util/dimensions.dart';
import 'package:gursha/widgets/app_column.dart';
import 'package:gursha/widgets/app_icon.dart';
import 'package:gursha/widgets/heading.dart';
import 'package:gursha/widgets/icon_and_text.dart';
import 'package:gursha/widgets/small_heading.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
              width: double.maxFinite,
              height: Dimensions.popularImgSize,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/beyaynet.jpg')))),
        ),
        Positioned(
          top: Dimensions.height15,
          left: Dimensions.width10,
          right: Dimensions.width10,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios_new),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ]),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularImgSize - 10,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width24, right: Dimensions.width24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.blue),
                child: AppColumn(
                    title: 'Traditional Rich Foods', size: Dimensions.font27)))
      ]),
    );
  }
}
