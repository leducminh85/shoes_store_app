import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: Container(
        height: 120.0, // height of the button
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, // shape makes the circular button
            gradient: kPrimaryGradientColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ElevatedButton(
          onPressed: press as void Function()?,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          child: Text(
            text!,
            style: TextStyle(fontSize: getProportionateScreenWidth(16)),
          ),
        ),
      ),
    );
  }
}
