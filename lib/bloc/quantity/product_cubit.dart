import 'package:bloc/bloc.dart';

class ProductCubit extends Cubit<int> {
  final int quantity;
  ProductCubit(this.quantity) : super(quantity);

  void increment() {
    if (state >= 20) {
      emit(state);
    } else {
      emit(state + 1);
    }
  }

  void decrement() {
    if (state <= 0) {
      emit(state);
    } else {
      emit(state - 1);
    }
  }

  void reset({int defalult = 0}) => emit(0);
}
