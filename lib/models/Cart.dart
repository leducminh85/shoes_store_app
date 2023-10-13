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

List<Cart> demoCarts = [];

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
