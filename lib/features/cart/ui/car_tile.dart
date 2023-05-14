import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app/features/home/models/home_prodcut_data.dart';

class CartTile extends StatelessWidget {
  final ProductData product;
  final CartBloc cartBloc;
  const CartTile({super.key, required this.product, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.height * 0.007,
      ),
      padding: EdgeInsets.only(
        top: size.width * 0.02,
        bottom: size.width * 0.02,
        left: size.height * 0.01,
        right: size.height * 0.03,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: size.width * 0.001,
            blurRadius: size.width * 0.01,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                product.image,
                width: size.width * 0.2,
                height: size.height * 0.1,
                cacheHeight: 100,
                cacheWidth: 100,
              ),
              SizedBox(width: size.width * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    Text(product.description),
                    Text('${product.price} ₹'),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // cartBloc.add(CartProductFavouriteButton(product: product));
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartDeleteProductEvent(product: product));
                    },
                    icon: const Icon(Icons.shopping_bag),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
