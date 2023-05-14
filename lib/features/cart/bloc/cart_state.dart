part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final List<ProductData> products;
  CartLoadedSuccessState({required this.products});
}

class CartSuccessState extends CartActionState {}

class CartRemoveProductState extends CartActionState {}