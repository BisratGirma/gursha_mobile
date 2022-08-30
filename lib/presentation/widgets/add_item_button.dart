import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/bloc/quantity/product_cubit.dart';
import 'package:gursha/data/models/products_model.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/heading.dart';

class AddItemButton extends StatelessWidget {
  final int quantity;
  final double textSize;
  final double padding;
  final ProductsModel product;
  const AddItemButton(
      {Key? key,
      required this.quantity,
      required this.product,
      required this.textSize,
      required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int sumPrice;
    if (quantity == 0) {
      sumPrice = product.price!;
    } else {
      sumPrice = product.price! * quantity;
    }

    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
          backgroundColor: MaterialStateProperty.all(AppColors.passColor),
        ),
        onPressed: () {
          if (quantity == 0) {
            context.read<CartCubit>().addItem(product, 1);
          } else {
            context.read<CartCubit>().addItem(product, quantity);
            context.read<ProductCubit>().reset();
          }
        },
        child: HeadingText(
          text: '\$$sumPrice | Add to Cart',
          color: Colors.white,
          size: textSize,
        ));
  }
}
