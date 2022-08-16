import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gursha/routes/route_guide.dart';
import 'package:gursha/util/colors.dart';
import 'package:gursha/util/dimensions.dart';
import 'package:gursha/widgets/app_icon.dart';
import 'package:gursha/widgets/expandable_text.dart';
import 'package:gursha/widgets/heading.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteGuide.getInitial());
                      },
                      child: const AppIcon(icon: Icons.clear)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)),
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                    child: HeadingText(
                        text: 'Yetsom Beyaynetu', size: Dimensions.font27)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/beyaynet.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width24, right: Dimensions.width24),
                  child: ExpandableText(
                      size: Dimensions.font20,
                      text:
                          'Yetsom Beyaynetu is an Ethiopian is an Ethiopianis an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian is an Ethiopian combination platter composed of vegan curries and veggies. We love the variety this type of dinner offers. Our version features a rich red lentil stew, tender collard greens simmered with tomatoes and warming berbere spice blend, and a spicy fresh tomato salad with chiles.'),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width24 * 2.5,
                right: Dimensions.width24 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                HeadingText(text: '\$99.99  ${'x'}  ${0}'),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add)
              ],
            ),
          ),
          Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        color: Colors.white),
                    child: Icon(Icons.favorite, color: Colors.orange),
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.height20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        color: AppColors.passColor),
                    child: HeadingText(
                      text: '\$10 | Add to Cart',
                      color: Colors.white,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
