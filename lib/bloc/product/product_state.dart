part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductsModel product;

  const ProductLoaded(this.product);

  @override
  List<Object> get props => [product];
}
