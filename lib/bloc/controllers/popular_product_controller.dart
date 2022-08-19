// import 'package:get/get.dart';
// import 'package:gursha/data/repository/popular_product_repo.dart';
// import 'package:gursha/models/products_model.dart';
// import 'package:gursha/util/colors.dart';

// class PopularProductController extends GetxController {
//   final PopularProductRepo popularProductRepo;
//   PopularProductController({required this.popularProductRepo});
//   List<ProductsModel> _popularProductList = [];
//   List<ProductsModel> get popularProductList => _popularProductList;

//   bool _isLoaded = false;
//   bool get isLoaded => _isLoaded;

//   int _quantity = 0;
//   int get quantity => _quantity;

//   Future<void> getPopularProductList() async {
//     Response response = await popularProductRepo.getPopularProductList();
//     if (response.statusCode == 200) {
//       _popularProductList = [];
//       _popularProductList.addAll(Product.fromJson(response.body).products);
//       _isLoaded = true;
//       update();
//     } else {}
//   }

//   void setQuantity(bool isIncrement) {
//     if (isIncrement) {
//       _quantity = checkQuantity(_quantity++);
//     } else {
//       _quantity = checkQuantity(_quantity--);
//     }
//     update();
//   }

//   int checkQuantity(int quantity) {
//     if (quantity < 0) {
//       Get.snackbar('Minimum', 'You have reached the minimum amount',
//           backgroundColor: AppColors.mainColor,
//           colorText: AppColors.backgroundColors);
//       return 0;
//     } else if (quantity > 25) {
//       Get.snackbar('Maximum', 'Maximum amount of order is 25',
//           backgroundColor: AppColors.mainColor,
//           colorText: AppColors.backgroundColors);
//       return 20;
//     } else {
//       return quantity;
//     }
//   }
// }
