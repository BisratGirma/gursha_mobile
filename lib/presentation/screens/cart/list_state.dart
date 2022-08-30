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
  final Dimensions dimensions;
  const ListState(
      {Key? key,
      required this.height,
      required this.cartState,
      required this.dimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TotalQuantityCubit(cartState.totalQuantity),
      child: Scaffold(
          body: Stack(children: [
        Positioned(
          top: height,
          left: dimensions.width24,
          right: dimensions.width24,
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
                iconSize: dimensions.iconSize24!,
              ),
            ),
            SizedBox(
              width: dimensions.width24! * 12,
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
                iconSize: dimensions.iconSize24!,
              ),
            ),
            BlocBuilder<TotalQuantityCubit, int>(
              builder: (context, totalQuantityState) {
                return CartIcon(
                    quantity: totalQuantityState,
                    fontSize: dimensions.font20!,
                    iconSize: dimensions.iconSize16!,
                    size: dimensions.height15!);
              },
            )
          ]),
        ),
        Positioned(
            top: height * 4.5,
            left: dimensions.width24,
            right: dimensions.width24,
            bottom: 0,
            child: Container(
                // color: Colors.blue[300],
                child: ListView.builder(
              itemCount: cartState.cart.length,
              itemBuilder: (context, index) {
                return Container(
                    height: dimensions.height20! * 7,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: dimensions.height10!),
                    child: Row(
                      children: [
                        ImageLoader(
                          url: cartState.cart[index].img!,
                          height: dimensions.height20! * 7,
                          width: dimensions.height20! * 7,
                        ),
                        SizedBox(width: dimensions.width10),
                        Expanded(
                            child: Container(
                          height: dimensions.height20! * 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HeadingText(
                                text: cartState.cart[index].name!,
                                color: Colors.black54,
                                size: dimensions.height20!,
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
                                            size: dimensions.height20!,
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
                                                  text: '$quantityState',
                                                  size: dimensions.font20!,
                                                ),
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
