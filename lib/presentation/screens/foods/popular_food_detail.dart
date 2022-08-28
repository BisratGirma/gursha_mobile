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
  const PopularFoodDetail({Key? key, required this.product}) : super(key: key);

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
                            height: Dimensions.popularImgSize,
                            fit: BoxFit.cover,
                            border: const BorderRadius.all(Radius.zero),
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).viewPadding.top +
                                Dimensions.height15,
                            left: Dimensions.width10,
                            right: Dimensions.width10,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Beamer.of(context).beamToNamed('/');
                                      },
                                      child: const AppIcon(
                                          icon: Icons.arrow_back_ios_new)),
                                  cartState is CartQuantityState
                                      ? CartIcon(quantity: cartState.quantity)
                                      : const AppIcon(
                                          icon: Icons.shopping_cart_outlined),
                                ])),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: Dimensions.popularImgSize - 21,
                            bottom: 0,
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width15,
                                    right: Dimensions.width15,
                                    top: Dimensions.height10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            Dimensions.radius30),
                                        topRight: Radius.circular(
                                            Dimensions.radius30)),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppColumn(
                                        title: state.product.name!,
                                        size: Dimensions.font27),
                                    SizedBox(height: Dimensions.height20),
                                    HeadingText(text: 'Introduce'),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                    Expanded(
                                        child: SingleChildScrollView(
                                      child: ExpandableText(
                                          text: state.product.description!),
                                    ))
                                  ],
                                )))
                      ]);
                    },
                  ),
                  bottomNavigationBar: Container(
                    height: Dimensions.navbarHeight,
                    padding: EdgeInsets.all(
                      Dimensions.height20,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColors,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20 * 2),
                            topRight:
                                Radius.circular(Dimensions.radius20 * 2))),
                    child: BlocBuilder<ProductCubit, int>(
                      builder: (context, quantity) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Counter(quantity: quantity),
                            AddItemButton(
                                quantity: quantity, product: state.product)
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
