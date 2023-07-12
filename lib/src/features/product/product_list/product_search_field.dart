import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/features/product/product/product.dart';
import 'package:flutter_products_list/src/features/product/product_list/product_sort_button.dart';

class ProductSearchField extends StatelessWidget {
  const ProductSearchField(
      {super.key, required this.onChanged, required this.onFilterChanged});

  final Function(ProductField) onFilterChanged;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: ProductSortButton(
        onChanged: onFilterChanged,
      )),
      onChanged: onChanged,
    );
  }
}
