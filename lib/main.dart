import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/category_page.dart';
import 'pages/cart_page.dart';
import 'pages/add_pet_page.dart';

void main() {
  runApp(const PetShopApp());
}

class PetShopApp extends StatelessWidget {
  const PetShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[900] ?? Colors.blue),
      ),
      home: const HomePage(),
      routes: {
        '/category': (context) => const CategoryPage(),
        '/cart': (context) => const CartPage(),
        '/add-pet': (context) => const AddPetPage(),
      },
    );
  }
}
