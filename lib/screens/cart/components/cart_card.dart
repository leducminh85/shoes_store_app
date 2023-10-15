import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            SizedBox(
                width: 88,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(widget.cart.product.images[0]),
                      ),
                    ))),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.product.title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "\$${widget.cart.product.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      "Size: ${widget.cart.size}",
                    )
                  ],
                ),
                Row(
                  children: [
                    RoundedIconBtn(
                      size: 30,
                      icon: Icons.remove,
                      showShadow: true,
                      press: () {
                        setState(() {
                          if (widget.cart.numOfItem > 1) {
                            widget.cart.numOfItem -= 1;
                          }
                          ;
                        });
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Text(
                      widget.cart.numOfItem.toString(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    RoundedIconBtn(
                      size: 30,
                      icon: Icons.add,
                      showShadow: true,
                      press: () {
                        setState(() {
                          widget.cart.numOfItem += 1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17),
              bottomLeft: Radius.circular(17),
              bottomRight: Radius.circular(17)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ));
  }
}
