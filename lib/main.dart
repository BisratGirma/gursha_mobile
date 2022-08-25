import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/data/models/products_model.dart';
import 'package:gursha/presentation/screens/cart_page.dart';
import 'package:gursha/presentation/screens/foods/popular_food_detail.dart';
import 'package:gursha/presentation/screens/foods/recommended_food_detail.dart';
import 'package:gursha/presentation/screens/home/main_food_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<PopularProductController>().getPopularProductList();
    // Get.find<RecommendedProductController>().getRecommendedProductList();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scrollBehavior: AppScrollBehavior(),
        title: 'Gursha',
        routeInformationParser: BeamerParser(),
        routerDelegate: BeamerDelegate(
            initialPath: '/',
            notFoundPage: BeamPage.notFound,
            locationBuilder: RoutesLocationBuilder(routes: {
              '/': (p0, p1, p2) => const Home(),
              '/popular/:id': (p0, p1, p2) {
                final pageId = p1.pathParameters['id'];
                final ProductsModel product = p2 as ProductsModel;
                return BeamPage(
                    key: ValueKey('popular-//'),
                    child: PopularFoodDetail(
                      product: product,
                    ));
              },
              '/recommended/:id': (p0, p1, p2) {
                final pageId = p1.pathParameters['id'];
                final ProductsModel product = p2 as ProductsModel;
                return BeamPage(
                    key: ValueKey('recommended-'),
                    child: RecommendedFoodDetail(
                      product: product,
                    ));
              },
              '/cart': (p0, p1, p2) {
                // final pageId = p1.pathParameters['id'];
                return const BeamPage(key: ValueKey('cart'), child: CartPage());
              }
            })),

        // initialRoute: RouteGuide.initial,
        // getPages: RouteGuide.routes,
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainFoodPage();
  }
}
