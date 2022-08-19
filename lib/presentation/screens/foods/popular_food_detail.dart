// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gursha/controllers/popular_product_controller.dart';
// import 'package:gursha/routes/route_guide.dart';
// import 'package:gursha/util/app_constants.dart';
// import 'package:gursha/util/colors.dart';
// import 'package:gursha/util/dimensions.dart';
// import 'package:gursha/widgets/app_column.dart';
// import 'package:gursha/widgets/app_icon.dart';
// import 'package:gursha/widgets/expandable_text.dart';
// import 'package:gursha/widgets/heading.dart';

// class PopularFoodDetail extends StatelessWidget {
//   final int pageId;
//   const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var product =
//         Get.find<PopularProductController>().popularProductList[pageId];

//     return Scaffold(
//         body: Stack(children: [
//           Positioned(
//             left: 0,
//             right: 0,
//             child: Container(
//                 width: double.maxFinite,
//                 height: Dimensions.popularImgSize,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(AppConstants.BASE_URL +
//                             AppConstants.UPLOAD_URL +
//                             product.img!)))),
//           ),
//           Positioned(
//             top: Dimensions.height15,
//             left: Dimensions.width10,
//             right: Dimensions.width10,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Get.toNamed(RouteGuide.initial);
//                       },
//                       child: const AppIcon(icon: Icons.arrow_back_ios_new)),
//                   const AppIcon(icon: Icons.shopping_cart_outlined)
//                 ]),
//           ),
//           Positioned(
//               left: 0,
//               right: 0,
//               top: Dimensions.popularImgSize - 21,
//               bottom: 0,
//               child: Container(
//                   padding: EdgeInsets.only(
//                       left: Dimensions.width15,
//                       right: Dimensions.width15,
//                       top: Dimensions.height10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(Dimensions.radius30),
//                           topRight: Radius.circular(Dimensions.radius30)),
//                       color: Colors.white),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppColumn(title: product.name!, size: Dimensions.font27),
//                       SizedBox(height: Dimensions.height20),
//                       HeadingText(text: 'Introduce'),
//                       SizedBox(
//                         height: Dimensions.height20,
//                       ),
//                       Expanded(
//                           child: SingleChildScrollView(
//                         child: ExpandableText(text: product.description!),
//                       ))
//                     ],
//                   )))
//         ]),
//         bottomNavigationBar:
//             GetBuilder<PopularProductController>(builder: (popularProduct) {
//           return Container(
//               height: Dimensions.navbarHeight,
//               padding: EdgeInsets.all(
//                 Dimensions.height20,
//               ),
//               decoration: BoxDecoration(
//                   color: AppColors.backgroundColors,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(Dimensions.radius20 * 2),
//                       topRight: Radius.circular(Dimensions.radius20 * 2))),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(Dimensions.height20),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(Dimensions.radius30),
//                         color: Colors.white),
//                     child: Row(children: [
//                       GestureDetector(
//                           onTap: () {
//                             popularProduct.setQuantity(false);
//                           },
//                           child: const Icon(Icons.remove,
//                               color: AppColors.signColor)),
//                       const SizedBox(width: 5),
//                       HeadingText(text: '${popularProduct.quantity}'),
//                       const SizedBox(width: 5),
//                       GestureDetector(
//                           onTap: () {
//                             popularProduct.setQuantity(true);
//                           },
//                           child:
//                               const Icon(Icons.add, color: AppColors.signColor))
//                     ]),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(Dimensions.height20),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(Dimensions.radius30),
//                         color: AppColors.passColor),
//                     child: HeadingText(
//                       text:
//                           '\$${product.price! * popularProduct.quantity == 0 ? 1 : popularProduct.quantity} | Add to Cart',
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ));
//         }));
//   }
// }
