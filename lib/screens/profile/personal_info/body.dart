import 'package:flutter/material.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/profile/my_profile_screen.dart';
import 'package:shop_app/screens/profile/personal_info/info_card.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utils/slide_animation.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InfoCard(title: 'Name', content: 'Default name'),
            InfoCard(title: 'Name', content: 'Default name'),
            InfoCard(title: 'Name', content: 'Default name'),
            InfoCard(title: 'Name', content: 'Default name'),
            InfoCard(title: 'Name', content: 'Default name'),
          ],
        ),
      ),
    );
  }
}
