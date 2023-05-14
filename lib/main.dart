import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/ui/cart.dart';
import 'package:shopping_app/features/wishlist/ui/wish_list.dart';

import 'features/home/ui/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/wishlist': (context) => const WishPage(),
        '/cart': (context) => const CartPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
