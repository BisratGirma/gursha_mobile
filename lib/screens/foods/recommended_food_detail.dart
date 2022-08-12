import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/burger.jpeg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
