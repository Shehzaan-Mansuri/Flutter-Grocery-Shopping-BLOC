import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/data/cart_items.dart';

import '../../home/models/home_prodcut_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(
        (event, emit) => _mapCartInitialEventToState(event, emit));
    on<CartDeleteProductEvent>(
        (event, emit) => _mapCartDeleteProductEventToState(event, emit));
  }

  _mapCartInitialEventToState(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoadingState());
    Future.delayed(const Duration(seconds: 2));
    emit(CartLoadedSuccessState(products: cartItems));
  }

  _mapCartDeleteProductEventToState(
      CartDeleteProductEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.product);
    debugPrint('Product deleted from cart');
    emit(CartLoadedSuccessState(products: cartItems));
  }
}
