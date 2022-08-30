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
import 'package:gursha/presentation/widgets/app_icon.dart';
import 'package:gursha/presentation/widgets/cart_icon.dart';
import 'package:gursha/presentation/widgets/expandable_text.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/image_loader.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final ProductsModel product;
  final Dimensions dimensions;
  const RecommendedFoodDetail(
      {Key? key, required this.product, required this.dimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var product =
    // Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return BlocProvider(
        create: (context) => ProductBloc(product)..add(LoadProductEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const Center(
                  child: Scaffold(
                body: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ),
              ));
            }
            if (state is ProductLoaded) {
              return BlocBuilder<CartCubit, CartState>(
                builder: (context, cartState) {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          toolbarHeight: 70,
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Beamer.of(context).beamBack();
                                    },
                                    child: AppIcon(
                                      icon: Icons.clear,
                                      iconSize: dimensions.iconSize16!,
                                    )),
                                cartState is CartQuantityState
                                    ? CartIcon(
                                        quantity: cartState.quantity,
                                        fontSize: dimensions.font20!,
                                        size: dimensions.height20!,
                                        iconSize: dimensions.iconSize16!,
                                      )
                                    : AppIcon(
                                        icon: Icons.shopping_cart_outlined,
                                        iconSize: dimensions.iconSize16!,
                                      )
                              ]),
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(dimensions.radius20!),
                                    topRight:
                                        Radius.circular(dimensions.radius20!)),
                              ),
                              width: double.maxFinite,
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 10),
                              child: Center(
                                  child: HeadingText(
                                      text: state.product.name!,
                                      size: dimensions.font27!)),
                            ),
                          ),
                          pinned: true,
                          backgroundColor: Colors.white,
                          expandedHeight: 300,

                          // Background Image of the sliver
                          flexibleSpace: FlexibleSpaceBar(
                              background: ImageLoader(
                            url: AppConstants.BASE_URL +
                                AppConstants.UPLOAD_URL +
                                product.img!,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          )),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: dimensions.width24!,
                                    right: dimensions.width24!),
                                child: ExpandableText(
                                  size: dimensions.font20!,
                                  text: state.product.description!,
                                  textHeight: 255,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    bottomNavigationBar: BlocProvider(
                      create: (context) => ProductCubit(0),
                      child: BlocBuilder<ProductCubit, int>(
                        builder: (context, quantityState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: dimensions.width24! * 2.5,
                                    right: dimensions.width24! * 2.5,
                                    top: dimensions.height10!,
                                    bottom: dimensions.height10!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => context
                                          .read<ProductCubit>()
                                          .decrement(),
                                      child: AppIcon(
                                          iconSize: dimensions.iconSize24!,
                                          iconColor: Colors.white,
                                          backgroundColor: AppColors.mainColor,
                                          icon: Icons.remove),
                                    ),
                                    HeadingText(
                                      text:
                                          '\$${state.product.price}  X  $quantityState',
                                      size: dimensions.font20!,
                                    ),
                                    GestureDetector(
                                      onTap: () => context
                                          .read<ProductCubit>()
                                          .increment(),
                                      child: AppIcon(
                                          iconSize: dimensions.iconSize24!,
                                          iconColor: Colors.white,
                                          backgroundColor: AppColors.mainColor,
                                          icon: Icons.add),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  height: dimensions.navbarHeight,
                                  padding: EdgeInsets.all(
                                    dimensions.height20!,
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColors.backgroundColors,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              dimensions.radius20! * 2),
                                          topRight: Radius.circular(
                                              dimensions.radius20! * 2))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(
                                            dimensions.height20!),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                dimensions.radius30!),
                                            color: Colors.white),
                                        child: const Icon(Icons.favorite,
                                            color: Colors.orange),
                                      ),

                                      AddItemButton(
                                        quantity: quantityState,
                                        product: state.product,
                                        textSize: dimensions.font27!,
                                        padding: dimensions.height20!,
                                      )
                                      // Container(
                                      //   padding:
                                      //       EdgeInsets.all(Dimensions.height20),
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(
                                      //           Dimensions.radius30),
                                      //       color: AppColors.passColor),
                                      //   //price
                                      //   child: HeadingText(
                                      //     text:
                                      //         '\$${state.product.price! * (quantityState == 0 ? 1 : quantityState)} | Add to Cart',
                                      //     color: Colors.white,
                                      //   ),
                                      // )
                                    ],
                                  ))
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
            return Scaffold(body: Container());
          },
        ));
  }
}
