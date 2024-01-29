import 'package:admin_panel/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.keyText,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.textInputAction,
    this.decoration,
    this.validator,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.text,
  });

  final TextEditingController? controller;
  final Key? keyText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  final String? text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      key: keyText,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: decoration,
      validator: validator,
      textCapitalization: textCapitalization,
    );
  }
}
