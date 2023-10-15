import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final Product product;
  final int size;

  int numOfItem;

  Cart({required this.product, required this.numOfItem, required this.size});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2, size: 30),
  Cart(product: demoProducts[1], numOfItem: 2, size: 30),
  Cart(product: demoProducts[3], numOfItem: 2, size: 30),
];

Function? addToCart(Cart cart) {
  final index = demoCarts.indexWhere(
      (item) => item.product == cart.product && item.size == cart.size);
  if (index == -1)
    demoCarts.add(cart);
  else {
    demoCarts[index].numOfItem += cart.numOfItem;
  }
  return null;
}

class CartModel extends ChangeNotifier {
  List<Cart> demoCarts = [];
  double totalValue = 0;
  final int unitPrice = 50;

  void addToCart(Cart cart) {
    final index = demoCarts.indexWhere(
        (item) => item.product == cart.product && item.size == cart.size);
    if (index == -1) {
      demoCarts.add(cart);
    } else {
      demoCarts[index].numOfItem += cart.numOfItem;
    }
    totalValue += cart.numOfItem * cart.product.price;
  }

  void removeFromCart(int index) {
    totalValue -= demoCarts[index].numOfItem * demoCarts[index].product.price;
    demoCarts.removeAt(index);
  }
}
