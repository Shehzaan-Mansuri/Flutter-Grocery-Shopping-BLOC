part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartDeleteProductEvent extends CartEvent {
  final ProductData product;

  CartDeleteProductEvent({required this.product});
}
