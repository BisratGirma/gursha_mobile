import 'package:flutter/material.dart';
import 'package:gursha/presentation/screens/home/food_page_body.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height15, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width24, right: Dimensions.width24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      HeadingText(
                        text: 'Ethiopia',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallHeadingText(text: 'city'),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Dimensions.width42,
                    height: Dimensions.width42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: AppColors.mainColor,
                      size: Dimensions.iconSize24,
                    ),
                  )
                ],
              )),
          const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }
}
