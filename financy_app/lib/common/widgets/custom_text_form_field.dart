import 'package:financy_app/common/constats/app_colors.dart';
import 'package:financy_app/common/constats/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hingText;
  final String? labelText;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyBoardType;
  final int? maxLength;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    this.padding,
    super.key,
    this.hingText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyBoardType,
    this.maxLength,
    this.textInputAction,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.greelightTwo),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hingText,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle:
              AppTextStyles.inputLabelText.copyWith(color: AppColors.gray),
          focusedBorder: defaultBorder,
          focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          errorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
