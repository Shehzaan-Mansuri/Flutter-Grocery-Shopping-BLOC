import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home/bloc/home_bloc.dart';
import 'package:shopping_app/features/home/ui/product_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();
  @override
  void initState() {
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateWishlistState) {
          debugPrint('Push to wishlist screen');
          Navigator.pushNamed(context, '/wishlist');
        } else if (state is HomeNavigateCartState) {
          debugPrint('Push to cart screen');
          Navigator.pushNamed(context, '/cart');
        } else if (state is HomeProductWishlistAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to wishlist'),
            ),
          );
        } else if (state is HomeProdcutCartAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to cart'),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          case HomeLoadedSuccessState:
            final sucessState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Shopping App'),
                actions: [
                  IconButton(
                    onPressed: () {
                      _homeBloc.add(HomeWishlistNavigate());
                    },
                    icon: const Icon(Icons.favorite_border_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      _homeBloc.add(HomeCarttNavigate());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: sucessState.products.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    product: sucessState.products[index],
                    homeBloc: _homeBloc,
                  );
                },
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
