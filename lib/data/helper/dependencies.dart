// import 'package:get/get.dart';
// import 'package:gursha/controllers/popular_product_controller.dart';
// import 'package:gursha/controllers/recommended_product_controller.dart';
// import 'package:gursha/data/api/api_client.dart';
// import 'package:gursha/data/repository/popular_product_repo.dart';
// import 'package:gursha/data/repository/recommended_products_repo';
// import 'package:gursha/util/app_constants.dart';

// Future<void> init() async {
//   //api client
//   Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

//   //repo
//   Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
//   Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

//   //controllers
//   Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
//   Get.lazyPut(
//       () => RecommendedProductController(recommendedProductRepo: Get.find()));
// }
