import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/features/product/product/product.dart';

class ProductSortButton extends StatelessWidget {
  const ProductSortButton({super.key, this.onChanged});

  final Function(ProductField)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      onSelected: onChanged,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ProductField>>[
        PopupMenuItem(
          value: ProductField.id,
          child: Text(ProductField.id.toString()),
        ),
        PopupMenuItem(
          value: ProductField.name,
          child: Text(ProductField.name.toString()),
        ),
        PopupMenuItem(
          value: ProductField.price,
          child: Text(ProductField.price.toString()),
        ),
        PopupMenuItem(
          value: ProductField.count,
          child: Text(ProductField.count.toString()),
        )
      ],
    );
  }
}
