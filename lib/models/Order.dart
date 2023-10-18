import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/PaymentOption.dart';

class Order {
  final String? id;
  final String? trackingNumber;
  final String? address;

  final DateTime? createdDay;
  final CartModel? cart;
  final PaymentOption? selectedPayment;
  String status;

  Order({
    this.id,
    this.trackingNumber,
    this.address,
    this.createdDay,
    this.cart,
    this.selectedPayment,
    this.status = 'Confirmed',
  });
  Order.copyObject({required Order other})
      : id = other.id,
        trackingNumber = other.trackingNumber,
        address = other.address,
        createdDay = other.createdDay,
        cart = other.cart,
        selectedPayment = other.selectedPayment,
        status = other.status;
}

class OrderModel extends ChangeNotifier {
  Order _order = Order(
      id: '',
      trackingNumber: '',
      address: '',
      createdDay: DateTime.now(),
      cart: cart,
      selectedPayment: currentPayment,
      status: 'Confirmed');

  Order get order => _order;

  void updateOrder(Order newOrder) {
    _order = Order(
      id: newOrder.id ?? _order.id,
      trackingNumber: newOrder.trackingNumber ?? _order.trackingNumber,
      address: newOrder.address ?? _order.address,
      createdDay: newOrder.createdDay ?? _order.createdDay,
      cart: newOrder.cart ?? _order.cart,
      selectedPayment: newOrder.selectedPayment ?? _order.selectedPayment,
      status: newOrder.status ?? _order.status,
    );
    notifyListeners();
  }

  void resetOrder() {
    updateOrder(Order(
        id: '',
        trackingNumber: '',
        address: '',
        createdDay: DateTime.now(),
        cart: cart,
        selectedPayment: currentPayment,
        status: 'Confirmed'));
    notifyListeners();
  }
}

OrderModel currentOrder = OrderModel();

class OrdersModel extends ChangeNotifier {
  List<Order> _orderListing = [];

  List<Order> get orderListing => _orderListing;

  void addToOrders(Order order) {
    _orderListing.add(order);

    notifyListeners();
  }

  void cancelOrder(Order order) {
    final index =
        _orderListing.indexWhere((orderItem) => orderItem.id == order.id);
    if (index >= 0) _orderListing.removeAt(index);
    notifyListeners();
  }
  // void removeFromCart(int index) {
  //   _totalValue -=
  //       _demoCarts[index].numOfItem * _demoCarts[index].product.price;
  //   _demoCarts.removeAt(index);
  //   notifyListeners();
  // }

  // void updateAmountOfProduct(int index, int change) {
  //   _demoCarts[index].numOfItem += change;
  //   _totalValue += change * _demoCarts[index].product.price;
  //   notifyListeners();
  // }
}

OrdersModel orders = OrdersModel();

String shippingAddress = '2972 Westheimer Rd. Santa Ana, Illinois 85486 ';
