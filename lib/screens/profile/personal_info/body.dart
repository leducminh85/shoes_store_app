import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/profile/my_profile_screen.dart';
import 'package:shop_app/screens/profile/personal_info/info_card.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utils/slide_animation.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool canBeEdit = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            InfoCard(
              title: 'Email',
              content: currentUser.email,
              isDisabled: true,
            ),
            InfoCard(
                title: 'Name',
                content: currentUser.fullName,
                isDisabled: !canBeEdit),
            InfoCard(
                title: 'Phone number',
                content: currentUser.phoneNumber,
                isDisabled: !canBeEdit),
            InfoCard(
                title: 'Address',
                content: currentUser.address,
                isDisabled: !canBeEdit),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: canBeEdit
                    ? Container(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DefaultButton(
                            text: 'Cancel',
                            width: getProportionateScreenWidth(150),
                            press: () {
                              setState(() {
                                canBeEdit = false;
                              });
                            },
                          ),
                          DefaultButton(
                            text: 'Save',
                            width: getProportionateScreenWidth(150),
                            press: () {
                              setState(() {
                                canBeEdit = false;
                              });
                            },
                          )
                        ],
                      ))
                    : DefaultButton(
                        text: 'Edit info',
                        press: () {
                          setState(() {
                            canBeEdit = true;
                          });
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
