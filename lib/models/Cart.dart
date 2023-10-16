import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Product.dart';

class CartItem {
  final Product product;
  final int size;

  int numOfItem;

  CartItem(
      {required this.product, required this.numOfItem, required this.size});
}

// Demo data for our cart

List<CartItem> demoCarts = [
  CartItem(product: demoProducts[0], numOfItem: 2, size: 30),
  CartItem(product: demoProducts[1], numOfItem: 2, size: 30),
  CartItem(product: demoProducts[3], numOfItem: 2, size: 30),
];

Function? addToCart(CartItem cart) {
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
  List<CartItem> _demoCarts = [];
  double _totalValue = 0;

  double get totalValue => _totalValue;
  List<CartItem> get demoCarts => _demoCarts;

  void addToCart(CartItem cart) {
    final index = _demoCarts.indexWhere(
        (item) => item.product == cart.product && item.size == cart.size);
    if (index == -1) {
      _demoCarts.add(cart);
    } else {
      _demoCarts[index].numOfItem += cart.numOfItem;
    }
    _totalValue += cart.numOfItem * cart.product.price;
    notifyListeners();
  }

  void removeFromCart(int index) {
    _totalValue -=
        _demoCarts[index].numOfItem * _demoCarts[index].product.price;
    _demoCarts.removeAt(index);
    notifyListeners();
  }

  void updateAmountOfProduct(int index, int change) {
    _demoCarts[index].numOfItem += change;
    _totalValue += change * _demoCarts[index].product.price;
    notifyListeners();
  }
}

CartModel cart = CartModel();
