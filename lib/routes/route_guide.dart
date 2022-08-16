import 'package:get/get.dart';
import 'package:gursha/screens/foods/popular_food_detail.dart';
import 'package:gursha/screens/foods/recommended_food_detail.dart';
import 'package:gursha/screens/home/main_food_page.dart';

class RouteGuide {
  static const String initial = '/';
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => '$initial';
  static String getPopularFood() => '$popularFood';
  static String getrecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () => const PopularFoodDetail(),
        transition: Transition.cupertino),
    GetPage(
        name: recommendedFood,
        page: () => const RecommendedFoodDetail(),
        transition: Transition.cupertino),
  ];
}
