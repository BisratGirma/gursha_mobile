import 'package:bloc/bloc.dart';

class ProductCubit extends Cubit<int> {
  ProductCubit() : super(0);

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

  void reset() => emit(0);
}
