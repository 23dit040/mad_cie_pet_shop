import 'pet.dart';

class CartItem {
  final Pet pet;
  int quantity;

  CartItem({required this.pet, this.quantity = 1});
}
