import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gursha/bloc/cart/cart_cubit.dart';
import 'package:gursha/presentation/routes/route_guide.dart';
import 'package:gursha/presentation/screens/home/main_food_page.dart';
import 'package:gursha/presentation/util/dimensions.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ], child: const MyAppRouter()),
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

class MyAppRouter extends StatelessWidget {
  const MyAppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Dimensions dimensions = Dimensions.getDimensions(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    return MaterialApp.router(
      scrollBehavior: AppScrollBehavior(),
      title: 'Gursha',
      routeInformationParser: BeamerParser(),
      routerDelegate: RouteGuide.beamerDelegate(dimensions),

      // initialRoute: RouteGuide.initial,
      // getPages: RouteGuide.routes,
    );
  }
}

class Home extends StatelessWidget {
  final Dimensions dimensions;
  const Home({Key? key, required this.dimensions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainFoodPage(
      dimensions: dimensions,
    );
  }
}
