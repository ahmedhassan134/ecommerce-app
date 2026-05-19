import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';


class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      maxLines: widget.maxLines ?? 1,

      autocorrect: true,
      cursorColor: Colors.black,
      cursorRadius: Radius.circular(16),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword! ? !isShowPassword : isShowPassword,
      // obscuringCharacter: '*',
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: TextStyle(
        color: Colors.black
      ),

      decoration: InputDecoration(
        suffixIconColor: Colors.white,
        errorStyle: TextStyle(
          color:Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        hintText: widget.hintText,
        hintStyle: AppTextStyle.regular20Weight,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: Colors.pink,

        suffixIcon: widget.isPassword!
            ? IconButton(
          onPressed: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
          icon: Icon(
            !isShowPassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        )
            : widget.suffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.darkGreyClr, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.darkGreyClr, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.darkGreyClr, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.darkGreyClr, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}