import 'package:sync_scrollable_list_tabs/src/models/product_model.dart';

class CategoryModel {
  final String name;
  final List<ProductModel> products;

  const CategoryModel({
    required this.name,
    required this.products,
  });
}
