import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/data/grocery_data.dart';
import 'package:shopping_app/data/wishlist_items.dart';
import 'package:shopping_app/features/home/models/home_prodcut_data.dart';

import '../../../data/cart_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(
        (event, emit) => _mapHomeInitialEventToState(event, emit));
    on<HomeProductWishlistButton>(
        (event, emit) => _mapHomeProductWishlistButtonToState(event, emit));
    on<HomeProdcutCartButton>(
        (event, emit) => _mapHomeProdcutCartButtonToState(event, emit));
    on<HomeWishlistNavigate>(
        (event, emit) => _mapHomeWishlistNavigateToState(event, emit));
    on<HomeCarttNavigate>(
        (event, emit) => _mapHomeCarttNavigateToState(event, emit));
  }

  _mapHomeProductWishlistButtonToState(
      HomeProductWishlistButton event, Emitter<HomeState> emit) {
    wishlistItems.add(event.product);
    emit(HomeProductWishlistAddedState());
    debugPrint('Wish list button pressed');
  }

  _mapHomeProdcutCartButtonToState(
      HomeProdcutCartButton event, Emitter<HomeState> emit) {
    cartItems.add(event.product);
    emit(HomeProdcutCartAddedState());
    debugPrint('Cart button pressed');
  }

  _mapHomeWishlistNavigateToState(
      HomeWishlistNavigate event, Emitter<HomeState> emit) {
    debugPrint('Navigate to wishlist screen');
    emit(HomeNavigateWishlistState());
  }

  _mapHomeCarttNavigateToState(
      HomeCarttNavigate event, Emitter<HomeState> emit) {
    debugPrint('Navigate to cart screen');
    emit(HomeNavigateCartState());
  }

  _mapHomeInitialEventToState(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductData(
                  id: e['id'],
                  name: e['name'],
                  price: e['price'],
                  description: e['description'],
                  image: e['image'],
                ))
            .toList()));
    debugPrint('Home loaded success');
  }
}
