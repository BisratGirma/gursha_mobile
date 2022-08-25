import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/quantity/product_cubit.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/heading.dart';

class Counter extends StatelessWidget {
  final int quantity;
  double? dimensions;
  double? radius;
  double? gaps;

  Counter(
      {Key? key,
      required this.quantity,
      this.dimensions,
      this.radius,
      this.gaps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dimensions = dimensions ?? Dimensions.height20;
    radius = radius ?? Dimensions.radius30;
    gaps = gaps ?? 10;
    return Container(
        padding: EdgeInsets.all(dimensions!),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!), color: Colors.white),
        child: Row(children: [
          GestureDetector(
              onTap: () {
                context.read<ProductCubit>().decrement();
                //popularProduct.setQuantity(false);
              },
              child: const Icon(Icons.remove, color: AppColors.signColor)),
          SizedBox(width: gaps!),
          HeadingText(text: '$quantity'),
          SizedBox(width: gaps!),
          GestureDetector(
              onTap: () {
                context.read<ProductCubit>().increment();
                // popularProduct.setQuantity(true);
              },
              child: const Icon(Icons.add, color: AppColors.signColor))
        ]));
  }
}
