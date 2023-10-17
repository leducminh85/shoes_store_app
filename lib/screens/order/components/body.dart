import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/screens/order/components/choose_type_of_order.dart';
import 'package:shop_app/screens/order/components/order_card.dart';
import 'package:shop_app/screens/payment/components/payment_option.dart';
import 'package:shop_app/screens/payment/components/shipping_info.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  Body();
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String type = 'Confirmed';
  String setType(String newType) {
    setState(() {
      type = newType;
    });
    return newType;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            ChooseTypeOfOrders(type: type, setType: setType),
            SizedBox(height: getProportionateScreenWidth(30)),
            ...List.generate(
              orders.orderListing.length,
              (index) {
                if (orders.orderListing[index].status == type)
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: OrderCard(
                      cartItem: orders.orderListing[index].cart!.demoCarts[0],
                    ),
                  );
                else
                  return SizedBox();
              },
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
