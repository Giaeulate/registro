import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? disableTextColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final Widget? child;
  final FontWeight? textFontWeight;

  const CustomButton({
    super.key,
    this.onPressed,
    this.text = 'Continuar',
    this.width,
    this.height,
    this.textColor,
    this.disableTextColor,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.child,
    this.textFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            width ?? double.maxFinite,
            height ?? 50,
          ),
          disabledBackgroundColor: ApplicationTheme.disableButtonColor,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        onPressed: onPressed,
        child: child ??
            CustomText(
              text: text,
              color: onPressed == null
                  ? disableTextColor ?? ApplicationTheme.disableTextButtonColor
                  : textColor ?? ApplicationTheme.white,
              fontWeight: textFontWeight ?? FontWeight.bold,
            ),
      ),
    );
  }
}
