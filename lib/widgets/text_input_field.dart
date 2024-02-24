import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String? labelText;
  final String? hintText;
  final bool? enabled;
  final String? initialValue;
  final int? maxLength;
  final String? counterText;
  final int? minLines;
  final int maxLines;
  final bool obscureText;
  final String? helperText;
  final AutovalidateMode? autoValidateMode;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool isNumber;
  final bool isDecimal;
  final bool isDate;
  final bool isMultiline;

  const TextFormFieldWidget({
    Key? key,
    this.width,
    this.labelText,
    this.hintText,
    this.controller,
    this.height,
    this.enabled = true,
    this.obscureText = false,
    this.validator,
    this.initialValue,
    this.autoValidateMode,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.counterText = "",
    this.minLines,
    this.maxLines = 1,
    this.helperText,
    this.textInputAction = TextInputAction.next,
    this.floatingLabelBehavior,
    this.isNumber = false,
    this.isDecimal = false,
    this.isDate = false,
    this.isMultiline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        maxLength: maxLength,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
        autovalidateMode: autoValidateMode,
        obscureText: obscureText,
        decoration: InputDecoration(
            labelText: labelText ?? "",
            hintText: hintText ?? "",
            suffixIcon: suffixIcon,
            helperText: helperText,
            filled: !enabled!,
            helperMaxLines: 3,
            suffixIconColor: Theme.of(context).iconTheme.color,
            floatingLabelBehavior: floatingLabelBehavior,
            counterText: counterText),
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isDate == true
                ? TextInputType.none
                : isMultiline == true
                    ? TextInputType.multiline
                    : null,
        textInputAction: textInputAction,
        inputFormatters: isNumber == true
            ? [
                isDecimal == false
                    ? FilteringTextInputFormatter.digitsOnly
                    : FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
              ]
            : null,
      ),
    );
  }
}
