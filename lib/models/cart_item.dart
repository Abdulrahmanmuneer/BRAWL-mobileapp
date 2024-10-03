import 'package:brawl_store/models/product.dart';
// ignore: duplicate_import
import 'package:brawl_store/models/product.dart';

class CartItem {
  int quantity;
  Product product;

  CartItem({
    required this.quantity,
    required this.product,
  });
}

List<CartItem> cartItems = [
  CartItem(quantity: 3, product: products[0]),
  CartItem(quantity: 1, product: products[1]),
];
