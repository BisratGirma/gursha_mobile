import 'package:flutter/material.dart';
import 'package:gursha/widgets/heading.dart';
import 'package:gursha/widgets/small_heading.dart';

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
            child: Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColor),
                      child: Icon(Icons.search_rounded,
                          color: Theme.of(context).backgroundColor),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}