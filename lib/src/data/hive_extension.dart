import 'package:flutter_products_list/src/features/product/product/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveExtension {
  static Future<void> init() async {
    await _initHive();

    _registerAdapters();

    await _initBoxes();
  }

  static Future<void> _initHive() async {
    await Hive.initFlutter();
  }

  static void _registerAdapters() {
    Hive.registerAdapter(ProductAdapter());
  }

  static Future<void> _initBoxes() async {
    await Hive.openBox<Product>(HiveBoxes.product);
  }
}

class HiveBoxes {
  static String product = 'product_box';
}
