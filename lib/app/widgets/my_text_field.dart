import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final int? maxLines;
  final int? minLines;
  final Widget? icon;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? Validator;
  final void Function(String?)? onSaved;

  const MyTextField(
      {Key? key,
      this.label,
      this.Validator,
      this.initialValue,
      this.controller,
      this.onSaved,
      this.maxLines,
      this.minLines,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      validator: Validator,
      controller: controller,
      style: const TextStyle(color: Colors.black87),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          suffixIcon: icon,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black45),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
