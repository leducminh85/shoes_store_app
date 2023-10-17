import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/screens/payment/components/shipping_card.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class ShippingInfo extends StatelessWidget {
  const ShippingInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String shippingAddress = ' ';

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionTitle(
                title: "Order No1250",
                press: () {},
              ),
              Text(
                  "${DateFormat('dd-MMM-yyyy').format(currentOrder.order.createdDay!)}")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tracking Number ${currentOrder.order.trackingNumber}"),
              Text("${currentOrder.order.status}")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ShippingCard(shippingAddress: shippingAddress)
        ],
      ),
    );
  }
}
