// import 'package:get/get.dart';
// import 'package:gursha/screens/foods/popular_food_detail.dart';
// import 'package:gursha/screens/foods/recommended_food_detail.dart';
// import 'package:gursha/screens/home/main_food_page.dart';

// class BeamerRoutes {
//   static const String initial = '/';
//   static const String popularFood = "/popular-food";
//   static const String recommendedFood = "/recommended-food";

//   static String getInitial() => '$initial';
//   static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
//   static String getrecommendedFood(int pageId) =>
//       '$recommendedFood?pageId=$pageId';

//   static List<GetPage> routes = [
//     GetPage(name: '/', page: () => const MainFoodPage()),
//     GetPage(
//         name: popularFood,
//         page: () {
//           var pageId = Get.parameters['pageId'];
//           return PopularFoodDetail(pageId: int.parse(pageId!));
//         },
//         transition: Transition.cupertino),
//     GetPage(
//         name: recommendedFood,
//         page: () {
//           var pageId = Get.parameters['pageId'];
//           return RecommendedFoodDetail(pageId: int.parse(pageId!));
//         },
//         transition: Transition.cupertino),
//   ];
// }

// import 'package:beamer/beamer.dart';
// import 'package:gursha/main.dart';

// class BeamerRoutes {
  // static String getInitial() => '$initial';
  // static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  // static String getrecommendedFood(int pageId) =>
  //     '$recommendedFood?pageId=$pageId';

  // static String getInitial() => '$initial';
  // static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  // static String getrecommendedFood(int pageId) =>
  //     '$recommendedFood?pageId=$pageId';

//   static Map<Pattern, dynamic Function(BuildContext, BeamState, Object?)> route = {
//     '/' : (p0, p1, p2) => const Home(),
//     '/popularFood?padeId=' (context, state, data) {
//       state
//     }
//   };
// }
// 