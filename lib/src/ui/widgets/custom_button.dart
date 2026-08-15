import 'package:flutter/material.dart';

import 'package:flutter_installer/src/ui/global/app_colors.dart';
import 'package:flutter_installer/src/ui/global/ui_helpers.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    this.onPressed,
    this.textStyle,
    this.buttonColor,
    this.isButtonDisabled = false,
  });

  final String text;
  final double width;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final bool isButtonDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(500),
          ),
          backgroundColor:
              buttonColor ?? Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.symmetric(
            horizontal: blockSize(context),
            vertical: blockSize(context) * 0.5,
          ),
        ),
        onPressed: isButtonDisabled ? null : onPressed,
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: textColorWhite,
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}