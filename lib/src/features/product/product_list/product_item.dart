import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/data/hive_extension.dart';
import 'package:flutter_products_list/src/features/product/product/product.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.index});

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      secondaryBackground: Container(
        color: Colors.red,
      ),
      onDismissed: (_) =>
          {Hive.box<Product>(HiveBoxes.product).deleteAt(index)},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(product.id.toString()),
              Text(product.name),
              Text(product.price.toString()),
              Text(product.count.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
