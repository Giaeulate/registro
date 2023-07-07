import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.height,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.textDecoration = TextDecoration.none,
    this.onTap,
    this.textOverflow,
    this.headLine,
    this.padding,
  }) : super(key: key);

  final String text;
  final Color? color;

  final FontWeight fontWeight;
  final double? height;
  final TextAlign textAlign;
  final int? maxLines;
  final TextDecoration textDecoration;
  final VoidCallback? onTap;
  final TextOverflow? textOverflow;
  final HeadLine? headLine;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: getStyle(headLine)?.copyWith(
            color: color ?? ApplicationTheme.black,
            fontWeight: fontWeight,
            height: height,
            decoration: textDecoration,
          ),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow:
              (maxLines != null) ? textOverflow ?? TextOverflow.ellipsis : null,
        ),
      ),
    );
  }
}

TextStyle? getStyle(HeadLine? headLine) {
  switch (headLine) {
    case HeadLine.headLine1:
      return ApplicationTheme.getApplicationTheme().textTheme.displayLarge;
    case HeadLine.headLine2:
      return ApplicationTheme.getApplicationTheme().textTheme.displayMedium;
    case HeadLine.headLine3:
      return ApplicationTheme.getApplicationTheme().textTheme.displaySmall;
    case HeadLine.headLine4:
      return ApplicationTheme.getApplicationTheme().textTheme.headlineMedium;
    case HeadLine.headLine5:
      return ApplicationTheme.getApplicationTheme().textTheme.headlineSmall;
    case HeadLine.headLine6:
      return ApplicationTheme.getApplicationTheme().textTheme.titleLarge;
    default:
      return ApplicationTheme.getApplicationTheme().textTheme.headlineMedium;
  }
}

enum HeadLine {
  headLine1,
  headLine2,
  headLine3,
  headLine4,
  headLine5,
  headLine6,
}
