
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    required this.onpPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    this.colorText ,
    this.colorBorderSide,
    this.width,

  });

  void Function()? onpPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? colorText;
  final Color? colorBorderSide;
  final String text;

  final double? width;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:  backgroundColor ,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
            side: BorderSide(
                color: colorBorderSide??Colors.transparent,
                width: 2
            )
        ),
        minimumSize: Size(width ?? double.infinity, 56),

      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: .w600, color: colorText),
      ),
    );
  }
}