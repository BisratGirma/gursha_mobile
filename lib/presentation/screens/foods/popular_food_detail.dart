import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/bloc/product/product_bloc.dart';
import 'package:gursha/bloc/quantity/product_cubit.dart';
import 'package:gursha/data/models/products_model.dart';
import 'package:gursha/presentation/util/app_constants.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/add_item_button.dart';
import 'package:gursha/presentation/widgets/app_column.dart';
import 'package:gursha/presentation/widgets/app_icon.dart';
import 'package:gursha/presentation/widgets/cart_icon.dart';
import 'package:gursha/presentation/widgets/counter.dart';
import 'package:gursha/presentation/widgets/expandable_text.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/image_loader.dart';

class PopularFoodDetail extends StatelessWidget {
  final ProductsModel product;
  final Dimensions dimensions;
  const PopularFoodDetail(
      {Key? key, required this.product, required this.dimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(product)..add(LoadProductEvent()),
          ),
          BlocProvider(
            create: (context) => ProductCubit(0),
          )
        ],
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ProductLoaded) {
              return Scaffold(
                  body: BlocBuilder<CartCubit, CartState>(
                    builder: (context, cartState) {
                      return Stack(children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: ImageLoader(
                            url: AppConstants.BASE_URL +
                                AppConstants.UPLOAD_URL +
                                state.product.img!,
                            width: double.maxFinite,
                            height: dimensions.popularImgSize,
                            fit: BoxFit.cover,
                            //border: const BorderRadius.all(Radius.zero),
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).viewPadding.top +
                                dimensions.height15!,
                            left: dimensions.width10,
                            right: dimensions.width10,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Beamer.of(context).beamToNamed('/');
                                      },
                                      child: AppIcon(
                                        icon: Icons.arrow_back_ios_new,
                                        iconSize: dimensions.iconSize24!,
                                      )),
                                  cartState is CartQuantityState
                                      ? CartIcon(
                                          quantity: cartState.quantity,
                                          fontSize: dimensions.font20!,
                                          size: dimensions.height20!,
                                          iconSize: dimensions.iconSize24!,
                                        )
                                      : AppIcon(
                                          icon: Icons.shopping_cart_outlined,
                                          iconSize: dimensions.iconSize24!),
                                ])),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: dimensions.popularImgSize! -
                                dimensions.height20!,
                            bottom: 0,
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: dimensions.width15!,
                                    right: dimensions.width15!,
                                    top: dimensions.height15!),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            dimensions.radius30!),
                                        topRight: Radius.circular(
                                            dimensions.radius30!)),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppColumn(
                                      title: state.product.name!,
                                      size: dimensions.font27!,
                                      spacing: 5,
                                      radius: dimensions.radius20!,
                                      padding: dimensions.height20!,
                                      // size: dimensions.height20!,
                                      ratingIconSize: dimensions.iconSize16!,
                                      iconSize: dimensions.iconSize24!,
                                      containerHeight: dimensions.height120!,
                                    ),
                                    SizedBox(height: dimensions.height20),
                                    HeadingText(
                                      text: 'Introduce',
                                      size: dimensions.font20!,
                                    ),
                                    SizedBox(
                                      height: dimensions.height10,
                                    ),
                                    Expanded(
                                        child: SingleChildScrollView(
                                      child: ExpandableText(
                                        text: state.product.description!,
                                        textHeight: 250,
                                        size: dimensions.font20!,
                                      ),
                                    ))
                                  ],
                                )))
                      ]);
                    },
                  ),
                  bottomNavigationBar: Container(
                    height: dimensions.navbarHeight,
                    padding: EdgeInsets.all(
                      dimensions.height20!,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColors,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(dimensions.radius20! * 2),
                            topRight:
                                Radius.circular(dimensions.radius20! * 2))),
                    child: BlocBuilder<ProductCubit, int>(
                      builder: (context, quantity) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Counter(
                              quantity: quantity,
                              counterTextHeighta: dimensions.font15!,
                              radius: dimensions.radius20!,
                              dimensions: dimensions.height15!,
                            ),
                            AddItemButton(
                              quantity: quantity,
                              product: state.product,
                              textSize: dimensions.font27!,
                              padding: dimensions.height20!,
                            )
                          ],
                        );
                      },
                    ),
                  ));
            }
            return Scaffold(body: Container());
          },
        ));
  }
}
