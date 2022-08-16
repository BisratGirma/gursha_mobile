import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gursha/controllers/popular_product_controller.dart';
import 'package:gursha/controllers/recommended_product_controller.dart';
import 'package:gursha/helper/dependencies.dart' as dependency;
import 'package:gursha/routes/route_guide.dart';
import 'package:gursha/screens/home/main_food_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: 'Gursha',
      home: const MainFoodPage(),
      initialRoute: RouteGuide.initial,
      getPages: RouteGuide.routes,
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
