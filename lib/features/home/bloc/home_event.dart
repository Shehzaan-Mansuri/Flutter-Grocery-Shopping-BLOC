part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButton extends HomeEvent {
  final ProductData product;

  HomeProductWishlistButton({required this.product});
}

class HomeProdcutCartButton extends HomeEvent {
  final ProductData product;

  HomeProdcutCartButton({required this.product});
}

class HomeWishlistNavigate extends HomeEvent {}

class HomeCarttNavigate extends HomeEvent {}
