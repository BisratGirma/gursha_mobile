import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gursha/data/api_client.dart';
import 'package:gursha/data/models/products_model.dart';
import 'package:gursha/presentation/util/app_constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiClient _product;

  HomeBloc(this._product) : super(HomeInitial()) {
    on<LoadApiEvent>(
      (event, emit) async {
        try {
          final popularProduct = await _product.getData(
              "${AppConstants.BASE_URL}${AppConstants.POPULAR_PRODUCT_URI}");
          final recommendedProduct = await _product.getData(
              "${AppConstants.BASE_URL}${AppConstants.RECOMMENDED_PRODUCT_URI}");

          emit(HomeLoaded(popularProduct, recommendedProduct));
        } catch (e) {
          emit(HomeError());
        }
      },
    );
  }
}
