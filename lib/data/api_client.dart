import 'package:gursha/data/models/products_model.dart';
import 'package:http/http.dart';

class ApiClient {
  Future<Product> getData(String uri) async {
    try {
      final response = await get(Uri.parse(uri));
      final activity = getProductFromJson(response.body);
      return activity;
    } catch (e) {
      return Product(totalSize: 0, typeId: 0, offset: 0, products: []);
    }
  }
}
