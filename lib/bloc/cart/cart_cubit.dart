import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gursha/data/models/cart_model.dart';
import 'package:gursha/data/models/products_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartInitial(0));

  Map<int, CartsModel> _items = {};
  int totalQuantity = 0;

  Map<int, CartsModel> get item => _items;
  void addItem(ProductsModel product, int quantity) {
    if (quantity > 0) {
      if (_items.containsKey(product.id)) {
        _items.update(product.id!, (value) {
          return CartsModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: (value.quantity! + quantity) > 20
                  ? 20
                  : value.quantity! + quantity,
              isExit: true,
              time: DateTime.now().toString());
        });
      } else {
        _items.putIfAbsent(
            product.id!,
            () => CartsModel(
                id: product.id,
                name: product.name,
                price: product.price,
                img: product.img,
                quantity: quantity,
                isExit: true,
                time: DateTime.now().toString()));
      }
      totalQuantity = 0;
      _items.forEach((key, value) {
        totalQuantity += value.quantity!;
      });
      emit(CartQuantityState(totalQuantity));
    }
  }

  void getCart() => emit(CartListState(item, totalQuantity));
}