import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/app_icon.dart';

class CartIcon extends StatelessWidget {
  final int quantity;
  final double size;
  final double fontSize;
  final double iconSize;
  const CartIcon(
      {Key? key,
      required this.quantity,
      required this.size,
      required this.fontSize,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartCubit>().getCart();
        Beamer.of(context).beamToNamed('/cart');
      },
      child: Stack(
        children: [
          AppIcon(icon: Icons.shopping_cart_outlined, iconSize: iconSize),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    '$quantity',
                    style: TextStyle(fontSize: fontSize, color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
