import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final VoidCallback? onTap;
  final double? border;
  final double? enableborder;
  final double? focusborder;
  final double? errorborder;
  final double? errorfocusborder;
  final EdgeInsetsGeometry? contentpadding;
  final bool readOnly;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextAlign textAlign;
  final TextStyle? hintstyle;
  final TextStyle? labelstyle;
  final Color? fillcolor;
  final Color? focusColor;
  final bool useUnderlineBorder;
  final Color? borderColor;
  final Color? enableBorderColor;
  final Color? focusBorderColor;

  const CommonTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.focusNode,
    this.maxLength,
    this.maxLines,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.onTap,
    this.border,
    this.focusborder,
    this.enableborder,
    this.errorborder,
    this.errorfocusborder,
    this.contentpadding,
    this.textAlign = TextAlign.start,
    this.hintstyle,
    this.labelstyle,
    this.fillcolor,
    this.focusColor,
    this.useUnderlineBorder = false,
    this.borderColor,
    this.enableBorderColor,
    this.focusBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder getInputBorder(double? radius, Color borderColor) {
      return useUnderlineBorder
          ? InputBorder.none
          : OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 5),
        borderSide: BorderSide(color: borderColor),
      );
    }

    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null, // Ensures no conflict
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      obscureText: isPassword,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      readOnly: readOnly,
      autofocus: autofocus,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      textAlign: textAlign,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,

      onTap: onTap,
      decoration: InputDecoration(
        filled: true,
        focusColor: focusColor ?? Colors.white,
        fillColor: fillcolor ?? Colors.white,
        labelStyle: labelstyle,
        hintStyle: hintstyle,
        contentPadding: contentpadding ?? EdgeInsets.all(15),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: getInputBorder(border, borderColor ?? Color(0xFF949494)),
        enabledBorder: getInputBorder(enableborder, enableBorderColor ?? Color(0xFFC9C9C9)),
        focusedBorder: getInputBorder(focusborder, focusBorderColor ?? Color(0xFFCCCCCC)),
        errorBorder: getInputBorder(errorborder, Colors.red),
        focusedErrorBorder: getInputBorder(errorfocusborder, Colors.redAccent),
        counterText: '',
      ),
    );
  }
}
