import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/app_icon.dart';
import 'package:gursha/presentation/widgets/cart_icon.dart';
import 'package:gursha/presentation/widgets/counter.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/image_loader.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).viewPadding.top + Dimensions.height20;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        if (cartState is CartListState) {
          return Scaffold(
              body: Stack(children: [
            Positioned(
              top: height,
              left: Dimensions.width24,
              right: Dimensions.width24,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().back();
                        Beamer.of(context).beamBack();
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios_new,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width24 * 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().back();
                        Beamer.of(context).beamToNamed('/');
                      },
                      child: AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                    CartIcon(quantity: cartState.totalQuantity)
                    // AppIcon(
                    //   icon: Icons.shopping_cart,
                    //   iconColor: Colors.white,
                    //   backgroundColor: AppColors.mainColor,
                    //   iconSize: Dimensions.iconSize24,
                    // ),
                  ]),
            ),
            Positioned(
                top: height * 4.5,
                left: Dimensions.width24,
                right: Dimensions.width24,
                bottom: 0,
                child: Container(
                    // color: Colors.blue[300],
                    child: ListView.builder(
                  itemCount: cartState.cart.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: Dimensions.height20 * 7,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            ImageLoader(
                              url: cartState.cart[index].img!,
                              height: Dimensions.height20 * 7,
                              width: Dimensions.height20 * 7,
                            ),
                            SizedBox(width: Dimensions.width10),
                            Expanded(
                                child: Container(
                              height: Dimensions.height20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  HeadingText(
                                    text: cartState.cart[index].name!,
                                    color: Colors.black54,
                                  ),
                                  SmallHeadingText(
                                    text: cartState.cart[index].time!,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      HeadingText(
                                        text:
                                            '\$${cartState.cart[index].price! * cartState.cart[index].quantity!}',
                                        color: Colors.green[400],
                                      ),
                                      Counter(
                                        quantity:
                                            cartState.cart[index].quantity!,
                                        dimensions: 5,
                                        radius: 9,
                                        gaps: 6,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ));
                  },
                )))
          ]));
        }

        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
