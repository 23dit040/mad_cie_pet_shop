import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  static final CartProvider _instance = CartProvider._internal();
  factory CartProvider() => _instance;
  CartProvider._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Pet pet) {
    final existingIndex = _items.indexWhere((item) => item.pet.id == pet.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(pet: pet));
    }
    notifyListeners();
  }

  void removeFromCart(String petId) {
    _items.removeWhere((item) => item.pet.id == petId);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (total, item) => total + (item.pet.price * item.quantity));
  }

  int get itemCount => _items.length;
}
