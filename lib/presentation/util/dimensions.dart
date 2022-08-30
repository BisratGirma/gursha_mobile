//import 'package:flutter/widgets.dart';

//Size size = WidgetsBinding.instance.window.physicalSize;
// double screenHeight = 800;
// double screenWidth = 400;

class Dimensions {
  double? pageView;
  double? pageViewContainer;
  double? pageViewTextContainer;
  double? height10;
  double? height15;
  double? height20;
  double? height100;
  double? height120;
  double? width10;
  double? width15;
  double? width24;
  double? width33;
  double? width42;
  //dynamic font and radius values
  double? font15;
  double? font20;
  double? font27;
  double? radius20;
  double? radius30;

  //icon size
  double? iconSize24;
  double? iconSize16;
  double? iconSize10;

  //list view sizes
  double? listViewImg;
  double? listViewTextContainer;

  //popular detail sizes
  double? popularImgSize;
  double? navbarHeight;

  Dimensions(
      this.font15,
      this.font20,
      this.font27,
      this.height10,
      this.height100,
      this.height120,
      this.height15,
      this.height20,
      this.iconSize10,
      this.iconSize16,
      this.iconSize24,
      this.listViewImg,
      this.listViewTextContainer,
      this.navbarHeight,
      this.pageView,
      this.pageViewContainer,
      this.pageViewTextContainer,
      this.popularImgSize,
      this.radius20,
      this.radius30,
      this.width10,
      this.width15,
      this.width24,
      this.width33,
      this.width42);
  Dimensions.getDimensions(double screenHeight, double screenWidth) {
    //height and width
    pageView = screenHeight / 2.43;
    pageViewContainer = screenHeight / 3.6;
    pageViewTextContainer = screenHeight / 6.3;
    height10 = screenHeight / 84.3;
    height15 = screenHeight / 56.4;
    height20 = screenHeight / 42;
    height100 = screenHeight / 9;
    height120 = screenHeight / 6;
    width10 = screenHeight / 84.3;
    width15 = screenHeight / 56.4;
    width24 = screenHeight / 42;
    width33 = screenHeight / 33;
    width42 = screenHeight / 20.4;

    //dynamic font and radius values
    font15 = screenHeight / 52.74;
    font20 = screenHeight / 42;
    font27 = screenHeight / 33;
    radius20 = screenHeight / 42;
    radius30 = screenHeight / 28.05;

    //icon size
    iconSize24 = screenHeight / 34.7;
    iconSize16 = screenHeight / 52.2;
    iconSize10 = screenHeight / 72;

    //list view sizes
    listViewImg = screenWidth / 3.24;
    listViewTextContainer = screenWidth / 4.2;

    //popular detail sizes
    popularImgSize = screenWidth / 2.01;
    navbarHeight = screenHeight / 7.02;
  }
  //dynamic page view values for body
  // static double pageView = screenHeight / 2.43;
  // static double ;
  // static double ;

  // //dynamic height values
  // static double ;
  // static double ;
  // static double ;
  // static double ;
  // static double ;

  // //dynamic width values
  // static double ;
  // static double width15 = screenHeight / 56.4;
  // static double width24 = screenHeight / 42;
  // static double width33 = screenHeight / 33;
  // static double width42 = screenHeight / 20.4;

}
