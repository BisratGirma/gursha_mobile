import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/bloc/quantity/product_cubit.dart';
import 'package:gursha/bloc/quantity/total_quantity_cubit.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/app_icon.dart';
import 'package:gursha/presentation/widgets/cart_icon.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/image_loader.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class ListState extends StatelessWidget {
  final double height;
  final CartListState cartState;
  const ListState({Key? key, required this.height, required this.cartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TotalQuantityCubit(cartState.totalQuantity),
      child: Scaffold(
          body: Stack(children: [
        Positioned(
          top: height,
          left: Dimensions.width24,
          right: Dimensions.width24,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            BlocBuilder<TotalQuantityCubit, int>(
              builder: (context, totalQuantityState) {
                return CartIcon(quantity: totalQuantityState);
              },
            )
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HeadingText(
                                text: cartState.cart[index].name!,
                                color: Colors.black54,
                              ),
                              SmallHeadingText(
                                text: cartState.cart[index].time!,
                              ),
                              BlocProvider(
                                create: (context) => ProductCubit(
                                    cartState.cart[index].quantity!),
                                child: BlocBuilder<ProductCubit, int>(
                                  builder: (context, quantityState) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          HeadingText(
                                            text:
                                                '\$${cartState.cart[index].price! * quantityState}',
                                            color: Colors.green[400],
                                          ),
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  color: Colors.white),
                                              child: Row(children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .read<ProductCubit>()
                                                          .decrement();

                                                      context
                                                          .read<CartCubit>()
                                                          .decrementItem(
                                                              cartState
                                                                  .cart[index],
                                                              index);
                                                      context
                                                          .read<
                                                              TotalQuantityCubit>()
                                                          .decrement();
                                                    },
                                                    child: const Icon(
                                                        Icons.remove,
                                                        color: AppColors
                                                            .signColor)),
                                                const SizedBox(width: 6),
                                                HeadingText(
                                                    text: '$quantityState'),
                                                const SizedBox(width: 6),
                                                GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .read<ProductCubit>()
                                                          .increment();
                                                      context
                                                          .read<CartCubit>()
                                                          .incrementItem(
                                                              cartState
                                                                  .cart[index],
                                                              index);
                                                      context
                                                          .read<
                                                              TotalQuantityCubit>()
                                                          .increment();
                                                    },
                                                    child: const Icon(Icons.add,
                                                        color: AppColors
                                                            .signColor))
                                              ]))
                                        ]);
                                  },
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    ));
              },
            )))
      ])),
    );
  }
}
