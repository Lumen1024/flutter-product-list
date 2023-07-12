import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ProductTextFieldType { text, number }

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.label,
    this.type = ProductTextFieldType.text,
  });

  final Function(String) onChanged;
  final String label;
  final ProductTextFieldType type;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    TextInputType? keyboardType;
    List<TextInputFormatter>? formatters;
    String hintText = "";

    if (widget.type == ProductTextFieldType.number) {
      keyboardType = TextInputType.number;
      formatters = <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
      hintText = "0";
    }

    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      inputFormatters: formatters,
      onChanged: widget.onChanged,
      maxLines: 1,
    );
  }
}
