import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart/bloc/cart_bloc.dart';

import 'car_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc _cartBloc = CartBloc();
  @override
  void initState() {
    _cartBloc.add(CartInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer(
        bloc: _cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        listener: (context, state) {
          if (state is CartDeleteProductEvent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product deleted from cart'),
              ),
            );
          }
        },
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CartLoadedSuccessState:
              final products = (state as CartLoadedSuccessState).products;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CartTile(
                    product: products[index],
                    cartBloc: _cartBloc,
                  );
                },
              );
            default:
              return const Center(
                child: Text('Error'),
              );
          }
        },
      ),
    );
  }
}
