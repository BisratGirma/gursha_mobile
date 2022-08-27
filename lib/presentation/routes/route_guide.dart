import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:gursha/data/models/products_model.dart';
import 'package:gursha/main.dart';
import 'package:gursha/presentation/screens/cart_page.dart';
import 'package:gursha/presentation/screens/foods/popular_food_detail.dart';
import 'package:gursha/presentation/screens/foods/recommended_food_detail.dart';

class RouteGuide {
  static BeamerDelegate beamerDelegate = BeamerDelegate(
      initialPath: '/',
      notFoundPage: BeamPage.notFound,
      locationBuilder: RoutesLocationBuilder(routes: {
        '/': (p0, p1, p2) => const Home(),
        '/popular/:id': (p0, p1, p2) {
          //final pageId = p1.pathParameters['id'];
          final ProductsModel product = p2 as ProductsModel;
          return BeamPage(
              key: const ValueKey('popular-/'),
              child: PopularFoodDetail(
                product: product,
              ));
        },
        '/recommended/:id': (p0, p1, p2) {
          //final pageId = p1.pathParameters['id'];
          final ProductsModel product = p2 as ProductsModel;
          return BeamPage(
              key: const ValueKey('recommended-/'),
              child: RecommendedFoodDetail(
                product: product,
              ));
        },
        '/cart': (p0, p1, p2) {
          // final pageId = p1.pathParameters['id'];
          return const BeamPage(key: ValueKey('cart'), child: CartPage());
        }
      }));
}
