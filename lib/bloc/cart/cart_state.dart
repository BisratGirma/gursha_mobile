part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  final int totalQuantity;
  const CartInitial(this.totalQuantity);

  @override
  List<Object> get props => [totalQuantity];
}

class CartQuantityState extends CartState {
  final int quantity;

  const CartQuantityState(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class CartListState extends CartState {
  final List<CartsModel> cart;
  final int totalQuantity;
  const CartListState(this.cart, this.totalQuantity);

  @override
  List<Object> get props => [cart, totalQuantity];
}

class UpdateListState extends CartState {
  final List<CartsModel> cart;
  final int totalQuantity;
  const UpdateListState(this.cart, this.totalQuantity);

  @override
  List<Object> get props => [cart, totalQuantity];
}
