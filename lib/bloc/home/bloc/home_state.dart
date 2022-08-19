part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final Product popularProduct;
  final Product recommendedProduct;

  const HomeLoaded(this.popularProduct, this.recommendedProduct);

  //Implements Props
  @override
  List<Object> get props => [popularProduct, recommendedProduct];
}
