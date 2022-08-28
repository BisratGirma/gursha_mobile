import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/presentation/screens/cart/list_state.dart';
import 'package:gursha/presentation/util/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).viewPadding.top + Dimensions.height20;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        if (cartState is CartListState) {
          return ListState(height: height, cartState: cartState);
        }

        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
