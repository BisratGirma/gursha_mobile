import 'package:bloc/bloc.dart';

class TotalQuantityCubit extends Cubit<int> {
  final int quantity;
  TotalQuantityCubit(this.quantity) : super(quantity);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void reset({int defalult = 0}) => emit(defalult);
}
