import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SizeDots extends StatelessWidget {
  const SizeDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedSize = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            product.sizes.length,
            (index) => SizeDot(
              size: product.sizes[index],
              isSelected: index == selectedSize,
              press: () {
                selectedSize = index;
              },
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {},
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class SizeDot extends StatelessWidget {
  const SizeDot({
    Key? key,
    required this.size,
    this.isSelected = false,
    required this.press,
  }) : super(key: key);

  final int size;
  final bool isSelected;
  final GestureTapCancelCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 1),
        padding: EdgeInsets.all(getProportionateScreenWidth(3)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$size",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            )),
      ),
    );
  }
}
