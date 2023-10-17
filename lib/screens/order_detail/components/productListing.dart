import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/PaymentOption.dart';
import 'package:shop_app/screens/order_detail/components/product_card.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(
            title: "Order details",
            press: () {},
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          ...List.generate(
            currentOrder.order.cart!.demoCarts.length,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ProductCard(
                  index: index,
                  cartItem: currentOrder.order.cart!.demoCarts[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
