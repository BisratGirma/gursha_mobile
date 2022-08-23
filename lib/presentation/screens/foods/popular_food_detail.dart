import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/product/product_bloc.dart';
import 'package:gursha/bloc/quantity/product_cubit.dart';
import 'package:gursha/data/models/products_model.dart';
import 'package:gursha/presentation/util/app_constants.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/app_column.dart';
import 'package:gursha/presentation/widgets/app_icon.dart';
import 'package:gursha/presentation/widgets/expandable_text.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/image_loader.dart';

class PopularFoodDetail extends StatelessWidget {
  final ProductsModel product;
  const PopularFoodDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductBloc(product)..add(LoadProductEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded) {
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
                  ),

                  //   Container(
                  //       width: double.maxFinite,
                  //       height: Dimensions.popularImgSize,
                  //       decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //               fit: BoxFit.cover,
                  //               image: NetworkImage(AppConstants.BASE_URL +
                  //                   AppConstants.UPLOAD_URL +
                  //                   state.product.img!)))),
                ),
                Positioned(
                  top: MediaQuery.of(context).viewPadding.top +
                      Dimensions.height15,
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Beamer.of(context).beamBack();
                            },
                            child:
                                const AppIcon(icon: Icons.arrow_back_ios_new)),
                        const AppIcon(icon: Icons.shopping_cart_outlined)
                      ]),
                ),
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
                                topLeft: Radius.circular(Dimensions.radius30),
                                topRight: Radius.circular(Dimensions.radius30)),
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
            }
            return Container();
          },
        ),
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
                  topRight: Radius.circular(Dimensions.radius20 * 2))),
          child: BlocProvider(
            create: (context) => ProductCubit(),
            child: BlocBuilder<ProductCubit, int>(
              builder: (context, quantity) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          color: Colors.white),
                      child: Row(children: [
                        GestureDetector(
                            onTap: () {
                              context.read<ProductCubit>().decrement();
                              //popularProduct.setQuantity(false);
                            },
                            child: const Icon(Icons.remove,
                                color: AppColors.signColor)),
                        const SizedBox(width: 10),
                        HeadingText(text: '$quantity'),
                        const SizedBox(width: 10),
                        GestureDetector(
                            onTap: () {
                              context.read<ProductCubit>().increment();
                              // popularProduct.setQuantity(true);
                            },
                            child: const Icon(Icons.add,
                                color: AppColors.signColor))
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          color: AppColors.passColor),
                      child: HeadingText(
                        text:
                            '\$${product.price! * quantity == 0 ? 1 : quantity} | Add to Cart',
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
