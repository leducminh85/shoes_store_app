import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/SearchData.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/size_config.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  void initState() {
    super.initState();
    searchMode.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  void dispose() {
    searchMode.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> result = searchMode.searchText != ''
        ? demoProducts
            .where((product) => (' ' + product.title.toUpperCase())
                .contains(' ' + searchMode.searchText.toUpperCase()))
            .toList()
        : [];
    if (result.length > 0)
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          spacing: 8.0, // Horizontal spacing between items
          runSpacing: 8.0, // Vertical spacing between rows
          children: [
            ...List.generate(
              result.length,
              (index) {
                return ProductCard(product: result[index]);
              },
            ),
          ],
        ),
      );
    else
      return SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 200, horizontal: 50),
            child: SvgPicture.asset(
              "assets/icons/Empty List.svg",
              width: 200,
              height: 200,
              color: Colors.grey.shade300,
            ),
          ));
  }
}
