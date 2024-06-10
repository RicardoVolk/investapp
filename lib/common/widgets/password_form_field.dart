import 'dart:developer';

import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFordField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final String? hingText;
  final String? labelText;

  const PasswordFordField(
      {super.key,
      required this.controller,
      this.padding,
      this.hingText,
      this.labelText});

  @override
  State<PasswordFordField> createState() => _PasswordFordFieldState();
}

class _PasswordFordFieldState extends State<PasswordFordField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      hingText: widget.hingText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23.0),
        onTap: () {
          log("teste");
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
