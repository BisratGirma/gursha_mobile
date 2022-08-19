import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/home/bloc/home_bloc.dart';
import 'package:gursha/data/api_client.dart';
import 'package:gursha/presentation/screens/home/main_food_page.dart';

// import 'package:get/get.dart';
// import 'package:gursha/controllers/popular_product_controller.dart';
// import 'package:gursha/controllers/recommended_product_controller.dart';
// import 'package:gursha/helper/dependencies.dart' as dependency;
// import 'package:gursha/routes/route_guide.dart';
// import 'package:gursha/screens/home/main_food_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: AppScrollBehavior(),
        title: 'Gursha',
        home: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(ApiClient()),
            )
          ],
          child: const MainFoodPage(),
        )

        // initialRoute: RouteGuide.initial,
        // getPages: RouteGuide.routes,
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
