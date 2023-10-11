import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int selectedItem = 2;
    List<Map<String, dynamic>> categories = [
      {"icon": "", "text": "Brand"},
      {"icon": "assets/icons/puma_icon.svg", "text": "Puma", "type": 'item'},
      {"icon": "assets/icons/nike_icon.svg", "text": "Nike", "type": 'item'},
      {
        "icon": "assets/icons/adidas_icon.svg",
        "text": "Adidas",
        "type": 'item'
      },
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            type: categories[index]["type"],
            press: () {
              selectedItem = index;
            },
            isSelected: selectedItem == index,
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.icon,
      required this.text,
      required this.press,
      required this.isSelected,
      this.type})
      : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;
  final String? type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (type == "item")
      return GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(65),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                height: getProportionateScreenWidth(45),
                width: getProportionateScreenWidth(65),
                decoration: BoxDecoration(
                    gradient: isSelected!
                        ? kPrimaryGradientColor2
                        : kPrimaryGradientColor3,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: kPrimaryColor)),
                child: SvgPicture.asset(icon!),
              ),
              SizedBox(height: 5),
              // Text(text!, textAlign: TextAlign.center)
            ],
          ),
        ),
      );
    else
      return GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(80),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                height: getProportionateScreenWidth(45),
                width: getProportionateScreenWidth(80),
                decoration: BoxDecoration(
                    gradient: kPrimaryGradientColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: kPrimaryColor)),
                child: Center(
                  child: Text(
                    'Brand',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Text(text!, textAlign: TextAlign.center)
            ],
          ),
        ),
      );
  }
}
