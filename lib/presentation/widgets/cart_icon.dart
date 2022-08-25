import 'package:flutter/material.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/app_icon.dart';

class CartIcon extends StatelessWidget {
  final CartQuantityState cartState;
  const CartIcon({Key? key, required this.cartState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppIcon(icon: Icons.shopping_cart_outlined),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
              height: Dimensions.height20,
              width: Dimensions.height20,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  '${cartState.quantity}',
                  style: TextStyle(
                      fontSize: Dimensions.font15, color: Colors.white),
                ),
              )),
        )
      ],
    );
  }
}
