import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final Product product;
  final int size;

  final int numOfItem;

  Cart({required this.product, required this.numOfItem, required this.size});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2, size: 30),
  Cart(product: demoProducts[1], numOfItem: 2, size: 30),
  Cart(product: demoProducts[3], numOfItem: 2, size: 30),
];

Function? addToCart(Cart cart) {
  demoCarts.add(cart);
  return null;
}
