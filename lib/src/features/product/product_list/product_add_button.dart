import 'package:flutter/material.dart';
import 'package:flutter_products_list/src/constants/strings.dart';

class ProductAddButton extends StatelessWidget {
  const ProductAddButton({super.key, required this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: Strings.addButtonText,
      child: const Icon(Icons.add),
    );
  }
}
