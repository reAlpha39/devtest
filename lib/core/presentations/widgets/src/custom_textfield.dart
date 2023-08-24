import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.isPassword = false,
    this.controller,
    this.focusNode,
    this.hint,
    this.leading,
    this.suffixIcon,
    this.obscure = false,
    this.borderColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.onTap,
    this.textInputType,
    this.onChange,
    this.hintStyle,
    this.showTitle = false,
    this.title,
    this.titleStyle,
    this.titleColor,
    this.maxLines = 1,
    this.height,
    this.constraintHeight = false,
    this.maxLength,
    this.validator,
    this.textFieldStyle,
    this.autovalidateMode,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hint;
  final Widget? leading;
  final Widget? suffixIcon;
  final bool obscure;
  final bool isPassword;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final VoidCallback? onTap;
  final TextInputType? textInputType;
  final Function(String)? onChange;
  final TextStyle? hintStyle;
  final bool showTitle;
  final String? title;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final int maxLines;
  final double? height;
  final bool constraintHeight;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextStyle? textFieldStyle;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obsureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.constraintHeight ? widget.height : null,
      child: TextFormField(
        controller: widget.controller ?? TextEditingController(),
        focusNode: widget.focusNode,
        obscureText: widget.isPassword ? _obsureText : widget.obscure,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode,
        style: widget.textFieldStyle ??
            TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w500,
            ),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: widget.hintStyle ??
              const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: widget.maxLines > 1 ? 12 : 0,
          ),
          filled: true,
          prefixIcon: widget.leading,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obsureText = !_obsureText;
                    });
                  },
                  child: Icon(
                    _obsureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                )
              : widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ).copyWith(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ).copyWith(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surfaceVariant,
            ),
          ),
        ),
        onTap: widget.onTap,
        readOnly: widget.onTap != null,
        keyboardType: widget.textInputType,
        onChanged: widget.onChange,
      ),
    );
  }
}
