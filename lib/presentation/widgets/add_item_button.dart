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
  final ProductsModel product;
  const AddItemButton({Key? key, required this.quantity, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.all(Dimensions.width33)),
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
          text:
              '\$${product.price! * quantity == 0 ? 1 : quantity} | Add to Cart',
          color: Colors.white,
        ));
  }
}
