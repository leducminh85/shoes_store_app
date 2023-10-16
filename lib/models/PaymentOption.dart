import 'package:flutter/material.dart';

class PaymentOption {
  final String icon;
  final String bankName;
  final String accountNumber;

  PaymentOption({
    required this.icon,
    required this.bankName,
    required this.accountNumber,
  });
}

List<PaymentOption> demoPayment = [
  PaymentOption(
      icon: 'assets/icons/bank1.svg',
      bankName: 'Axis Bank',
      accountNumber: '4055 3265 5666 8281'),
  PaymentOption(
      icon: 'assets/icons/bank2.svg',
      bankName: 'HDFC Bank',
      accountNumber: '4055 3265 5666 6246'),
];

String hideAccountNumber(String text) {
  return "*** **** ${text.substring(text.length - 4)}";
}
