import 'package:flutter/material.dart';

import 'constants/routes.dart';
import 'features/product/product_add/product_add_page.dart';
import 'features/product/product_list/product_list_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.productList: (context) => const ProductListPage(),
    Routes.addProduct: (context) => const ProductAddPage()
  };
}
