import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dyanmic page view values for body
  static double pageView = screenHeight / 2.43;
  static double pageViewContainer = screenHeight / 3.6;
  static double pageViewTextContainer = screenHeight / 6.3;

  //dynamic height values
  static double height10 = screenHeight / 84.3;
  static double height15 = screenHeight / 56.4;
  static double height20 = screenHeight / 42;
  static double height100 = screenHeight / 9;
  static double height120 = screenHeight / 6;

  //dynamic width values
  static double width10 = screenHeight / 84.3;
  static double width15 = screenHeight / 56.4;
  static double width24 = screenHeight / 42;
  static double width33 = screenHeight / 33;
  static double width42 = screenHeight / 20.4;

  //dynamic font and radius values
  static double font20 = screenHeight / 42;
  static double font27 = screenHeight / 33;
  static double radius20 = screenHeight / 42;
  static double radius30 = screenHeight / 28.05;

  //icon size
  static double iconSize24 = screenHeight / 34.7;
  static double iconSize16 = screenHeight / 52.2;

  //list view sizes
  static double listViewImg = screenWidth / 3.24;
  static double listViewTextContainer = screenWidth / 3.9;

  //popular detail sizes
  static double popularImgSize = screenWidth / 2.01;
  static double navbarHeight = screenHeight / 7.02;
}
