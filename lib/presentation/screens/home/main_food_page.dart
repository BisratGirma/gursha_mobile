import 'package:flutter/material.dart';
import 'package:gursha/presentation/screens/home/food_page_body.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class MainFoodPage extends StatelessWidget {
  final Dimensions dimensions;
  const MainFoodPage({Key? key, required this.dimensions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: dimensions.height15!, bottom: dimensions.height10!),
              padding: EdgeInsets.only(
                  left: dimensions.width24!, right: dimensions.width24!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      HeadingText(
                        text: 'Ethiopia',
                        color: AppColors.mainColor,
                        size: dimensions.font20!,
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
                    width: dimensions.width42,
                    height: dimensions.width42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: AppColors.mainColor,
                      size: dimensions.iconSize24,
                    ),
                  )
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height -
                dimensions.height100! +
                dimensions.height10!,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
                child: SingleChildScrollView(
                    child: FoodPageBody(dimensions: dimensions))),
          ),
        ],
      ),
    );
  }
}
