import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/PaymentOption.dart';
import 'package:shop_app/screens/order_detail/order_detail_screen.dart';
import 'package:shop_app/utils/create_id.dart';
// import 'package:intl/intl';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_app/components/loading.dart';

class CheckoutCard extends StatefulWidget {
  static String routeName = "/payment";

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: kPrimaryLightColor,
            size: 100,
          ),
        );
      },
    );

    // Simulate a delay (e.g., network request)
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "\$${cart.totalValue.abs().toStringAsFixed(3)}\n",
                    style: TextStyle(fontSize: 16, color: kPrimaryMediumColor),
                    children: [
                      TextSpan(
                        text: "View detailed bill",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Proceed to pay",
                    press: () {
                      _showLoadingDialog(context);
                      Future.delayed(Duration(seconds: 2), () {
                        currentOrder.updateOrder(Order(
                            address: shippingAddress,
                            trackingNumber: generateRandomNumberString(10),
                            selectedPayment: currentPayment));
                        orders.addToOrders(currentOrder.order);

                        resetCart();
                        currentOrder.resetOrder();
                        resetPayment();

                        Fluttertoast.showToast(
                            msg: "Payment successful!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: kPrimaryColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          OrderDetailScreen.routeName,
                          arguments: {
                            'order': orders
                                .orderListing[orders.orderListing.length - 1]
                          },
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
