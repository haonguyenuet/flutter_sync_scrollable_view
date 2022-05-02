import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sync_scrollable_list_tabs/src/constant/style_constant.dart';
import 'package:sync_scrollable_list_tabs/src/models/category_model.dart';
import 'package:sync_scrollable_list_tabs/src/models/product_model.dart';

extension IntExtensions on int {
  String toVND() {
    final formatNumber = NumberFormat('#,###,###');
    return "${formatNumber.format(this).replaceAll(',', '.')} ₫";
  }
}

// Widget for category item
class CategorySection extends StatelessWidget {
  final CategoryModel category;
  const CategorySection({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title,
        ...products,
      ],
    );
  }

  Widget get title => Container(
        padding: const EdgeInsets.only(left: 10),
        color: Colors.white,
        alignment: Alignment.centerLeft,
        child: Text(
          "${category.name.toUpperCase()} (${category.products.length})",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      );

  List<Widget> get products => List.generate(
        category.products.length,
        (index) {
          return ProductWidget(product: category.products[index]);
        },
      );
}

// Widget for product item
class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 140,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                name,
                desc,
                const Spacer(),
                price,
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get image => AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          product.image,
          fit: BoxFit.cover,
        ),
      );

  Widget get name => Text(
        product.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget get desc => const Text(
        "100+ sold  |  10+ likes",
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      );

  Widget get price => Text(
        product.price.toVND(),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: kPrimaryColor,
        ),
      );
}
