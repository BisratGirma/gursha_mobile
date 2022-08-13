import 'package:get/get.dart';
import 'package:gursha/controllers/popular_product_controller.dart';
import 'package:gursha/data/api/api_client.dart';
import 'package:gursha/data/repository/popular_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://a.com'));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
