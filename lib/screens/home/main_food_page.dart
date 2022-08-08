import 'package:flutter/material.dart';
import 'package:gursha/screens/home/food_page_body.dart';
import 'package:gursha/util/dimensions.dart';
import 'package:gursha/widgets/heading.dart';
import 'package:gursha/widgets/small_heading.dart';
import 'package:gursha/util/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
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
                        color: Theme.of(context).primaryColorDark,
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
