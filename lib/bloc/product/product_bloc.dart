import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gursha/data/models/products_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsModel product;
  // final ApiClient _product;
  ProductBloc(this.product) : super(ProductInitial()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoaded(product));
    });
  }
}
