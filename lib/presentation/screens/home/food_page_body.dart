import 'package:beamer/beamer.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  double _current = 0;
  final CarouselController _controller = CarouselController();

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
          if (state is HomeError) {
            return Center(
              child: Column(
                children: [
                  const Icon(Icons
                      .signal_wifi_statusbar_connected_no_internet_4_sharp),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Couldn't Connect to Internet"),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    icon: const Icon(Icons.replay_outlined),
                    label: const Text('Retry'),
                    onPressed: () =>
                        context.read<HomeBloc>()..add(LoadApiEvent()),
                  )
                ],
              ),
            );
          }
          if (state is HomeLoaded) {
            return Column(
              children: [
                //slides
                state.popularProduct.products.isNotEmpty
                    ? SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                                height: Dimensions.pageView,
                                child: CarouselSlider(
                                  carouselController: _controller,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    aspectRatio: 2.0,
                                    autoPlayInterval:
                                        const Duration(seconds: 9),
                                    autoPlayAnimationDuration:
                                        const Duration(seconds: 1),
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) =>
                                        setState(() {
                                      _current = index.toDouble();
                                    }),
                                  ),
                                  items: state.popularProduct.products
                                      .asMap()
                                      .map((i, product) => MapEntry(i,
                                          _buildPageItem(i, product, context)))
                                      .values
                                      .toList(),
                                )),
                            DotsIndicator(
                              dotsCount: state.popularProduct.products.length,
                              position: _current,
                              decorator: DotsDecorator(
                                  size: const Size.square(9.0),
                                  activeSize: const Size(18.0, 9.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: AppColors.signColor,
                                  activeColor: AppColors.mainColor),
                            )
                          ],
                        ),
                      )
                    : Container(),
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
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
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
      // ),
    );
  }
}
