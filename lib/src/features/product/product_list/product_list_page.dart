import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/common/app_bar.dart';
import 'package:flutter_products_list/src/constants/routes.dart';
import 'package:flutter_products_list/src/data/hive_extension.dart';
import 'package:flutter_products_list/src/features/product/product/product.dart';
import 'package:flutter_products_list/src/features/product/product_list/product_add_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'product_list.dart';
import 'product_search_field.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final Box<Product> productsBox = Hive.box<Product>(HiveBoxes.product);

  String searchText = "";

  void onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  ProductField sortField = ProductField.id;

  void onSortFilterChanged(ProductField value) {
    setState(() {
      sortField = value;
    });
  }

  void _addNewProduct() {
    Navigator.pushNamed(context, Routes.addProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          ProductSearchField(
            onChanged: onSearchChanged,
            onFilterChanged: onSortFilterChanged,
          ),
          ProductList(
            sortFilter: sortField,
            searchText: searchText,
          ),
        ],
      ),
      floatingActionButton: ProductAddButton(onPressed: _addNewProduct),
    );
  }
}
