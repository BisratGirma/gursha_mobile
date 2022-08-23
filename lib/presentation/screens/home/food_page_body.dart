import 'package:beamer/beamer.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/home/home.dart';
import 'package:gursha/data/api_client.dart';
import 'package:gursha/data/models/products_model.dart';
import 'package:gursha/presentation/util/app_constants.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/util/dimensions.dart';
import 'package:gursha/presentation/widgets/app_column.dart';
import 'package:gursha/presentation/widgets/heading.dart';
import 'package:gursha/presentation/widgets/icon_and_text.dart';
import 'package:gursha/presentation/widgets/image_loader.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
//   @override
  PageController pageController = PageController(viewportFraction: 0.84);

  var _currentPageValue = 0.0;

  final double _scaleFactor = 0.8;

  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() => _currentPageValue = pageController.page!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ApiClient())..add(LoadApiEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ));
          }
          if (state is HomeLoaded) {
            return Column(
              children: [
                //slides
                SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: state.popularProduct.products.isEmpty
                          ? 0
                          : state.popularProduct.products.length,
                      itemBuilder: (context, position) => _buildPageItem(
                          position,
                          state.popularProduct.products[position],
                          context)),
                ),
                DotsIndicator(
                  dotsCount: state.popularProduct.products.isEmpty
                      ? 1
                      : state.popularProduct.products.length,
                  position: _currentPageValue,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width33, bottom: Dimensions.height20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      HeadingText(text: 'Recommended'),
                      SizedBox(width: Dimensions.width10),
                      Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: HeadingText(
                            text: '.',
                            color: Colors.black26,
                          )),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        child: SmallHeadingText(text: 'Food pairing'),
                      ),
                    ],
                  ),
                ),

                state.recommendedProduct.products.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.recommendedProduct.products.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                context.beamToNamed('/recommended/$index',
                                    data: state
                                        .recommendedProduct.products[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: Dimensions.width24,
                                    right: Dimensions.width24,
                                    bottom: Dimensions.height15),
                                child: Row(children: [
                                  ImageLoader(
                                    url: AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        state.recommendedProduct.products[index]
                                            .img!,
                                    height: Dimensions.listViewImg,
                                    width: Dimensions.listViewImg,
                                    fit: BoxFit.cover,
                                    border: BorderRadius.circular(
                                        Dimensions.radius20),
                                  ),
                                  Expanded(
                                      child: AppColumn(
                                    title: state.recommendedProduct
                                        .products[index].name!,
                                  ))
                                ]),
                              ),
                            ))
                    : const CircularProgressIndicator(
                        color: AppColors.mainColor,
                      )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildPageItem(
      index, ProductsModel popularProduct, BuildContext context) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
              onTap: () {
                // Get.toNamed(RouteGuide.getPopularFood(index));
                context.beamToNamed('/popular/$index', data: popularProduct);
              },
              child: ImageLoader(
                url: AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    popularProduct.img!,
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width33, right: Dimensions.width33),
                border: BorderRadius.circular(Dimensions.radius30),
                fit: BoxFit.cover,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width42,
                    right: Dimensions.width42,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0))
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingText(text: popularProduct.name!),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        color: AppColors.mainColor,
                                        size: 15,
                                      )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallHeadingText(text: '4.3'),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallHeadingText(text: '7'),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallHeadingText(text: 'comments')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndText(
                                icon: Icons.circle_sharp,
                                text: 'Normal',
                                iconColor: AppColors.mainColor),
                            IconAndText(
                                icon: Icons.location_on,
                                text: '1 Km',
                                iconColor: AppColors.iconColor1)
                          ],
                        ),
                      ]),
                )),
          ),
        ],
      ),
    );
  }
}
