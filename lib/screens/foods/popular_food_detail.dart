import 'package:flutter/material.dart';
import 'package:gursha/util/colors.dart';
import 'package:gursha/util/dimensions.dart';
import 'package:gursha/widgets/app_column.dart';
import 'package:gursha/widgets/app_icon.dart';
import 'package:gursha/widgets/expandable_text.dart';
import 'package:gursha/widgets/heading.dart';

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
              top: Dimensions.popularImgSize - 21,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width15,
                      right: Dimensions.width15,
                      top: Dimensions.height10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius30),
                          topRight: Radius.circular(Dimensions.radius30)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                          title: 'Traditional Rich Foods',
                          size: Dimensions.font27),
                      SizedBox(height: Dimensions.height20),
                      HeadingText(text: 'Introduce'),
                      ExpandableText(
                          text:
                              'Yetsom Beyaynetu is an Ethiopian combination platter composed of vegan curries and veggies. We love the variety this type of dinner offers. Our version features a rich red lentil stew, tender collard greens simmered with tomatoes and warming berbere spice blend, and a spicy fresh tomato salad with chiles.')
                    ],
                  )))
        ]),
        bottomNavigationBar: Container(
            height: Dimensions.navbarHeight,
            padding: EdgeInsets.all(
              Dimensions.height20,
            ),
            decoration: BoxDecoration(
                color: AppColors.backgroundColors,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: Colors.white),
                  child: Row(children: [
                    const Icon(Icons.remove, color: AppColors.signColor),
                    HeadingText(text: '0'),
                    const Icon(Icons.add, color: AppColors.signColor)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.passColor),
                  child: HeadingText(
                    text: '\$10 | Add to Cart',
                    color: Colors.white,
                  ),
                )
              ],
            )));
  }
}
