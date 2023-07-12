import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/common/app_bar.dart';
import 'package:flutter_products_list/src/common/custom_card.dart';
import 'package:flutter_products_list/src/common/custom_text_form_field.dart';
import 'package:flutter_products_list/src/constants/strings.dart';
import 'package:flutter_products_list/src/data/hive_extension.dart';
import 'package:flutter_products_list/src/extensions/string.dart';
import 'package:flutter_products_list/src/features/product/product/product.dart';
import 'package:hive/hive.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  String name = '';
  int price = 0;
  int count = 0;

  void onAddProduct() {
    if (name.isEmpty) {
      _showErrorToast(context);
      return;
    }

    Hive.box<Product>(HiveBoxes.product)
        .add(Product(name: name, price: price, count: count));

    Navigator.pop(context);
  }

  void _showErrorToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text(Strings.addValidationErrorMessage),
        action: SnackBarAction(
            label: Strings.closeErrorSnackbarButtonText,
            onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomCard(
        child: Column(
          children: [
            CustomTextFormField(
              label: ProductField.name.toString(),
              onChanged: (value) => name = value,
            ),
            CustomTextFormField(
              label: ProductField.price.toString(),
              type: ProductTextFieldType.number,
              onChanged: (value) => price = value.toInt(),
            ),
            CustomTextFormField(
              label: ProductField.count.toString(),
              type: ProductTextFieldType.number,
              onChanged: (value) => count = value.toInt(),
            ),
            const SizedBox(
              height: 32,
            ),
            TextButton(
              onPressed: onAddProduct,
              child: const Text(Strings.addButtonText),
            )
          ],
        ),
      ),
    );
  }
}
