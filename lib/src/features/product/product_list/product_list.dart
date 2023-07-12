import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/constants/strings.dart';
import 'package:flutter_products_list/src/data/hive_extension.dart';
import 'package:flutter_products_list/src/features/product/product/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.sortFilter, this.searchText});

  final ProductField sortFilter;
  final String? searchText;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Box<Product> productsBox = Hive.box<Product>(HiveBoxes.product);
  late ValueNotifier<List<Product>> products =
      ValueNotifier<List<Product>>(productsBox.values.toList());

  @override
  void initState() {
    super.initState();

    productsBox.listenable().addListener(() {
      products.value = _getFilteredProducts();
    });
  }

  List<Product> _getFilteredProducts() {
    Iterable<Product> values = productsBox.values;
    values = _applySortFilter(values);
    values = _applySearchFilter(values);

    return values.toList();
  }

  Iterable<Product> _applySortFilter(Iterable<Product> values) {
    var sorted = values.toList();
    sorted.sort((a, b) => Product.compareByField(a, b, widget.sortFilter));
    return sorted;
  }

  Iterable<Product> _applySearchFilter(Iterable<Product> values) {
    if (widget.searchText!.isNotEmpty) {
      var tempValues = values
          .where((element) => element.name.contains(widget.searchText!))
          .toList();
      tempValues.sort((a, b) => a.name
          .indexOf(widget.searchText!)
          .compareTo(b.name.indexOf(widget.searchText!)));
      return tempValues;
    }
    return values;
  }

  @override
  Widget build(BuildContext context) {
    products.value = _getFilteredProducts();

    return ValueListenableBuilder(
      valueListenable: products,
      builder: (_, List<Product> box, __) {
        if (box.isEmpty) {
          return const PlaceholderText();
        }

        return Expanded(
          child: ListView.builder(
            itemCount: box.length,
            itemBuilder: (_, index) =>
                ProductItem(product: box[index], index: index),
          ),
        );
      },
    );
  }
}

class PlaceholderText extends StatelessWidget {
  const PlaceholderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Strings.emptyListMessage),
    );
  }
}
