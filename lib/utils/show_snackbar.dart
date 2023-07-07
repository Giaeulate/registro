import 'package:flutter/material.dart';
import 'size_config.dart';
import '../global/environment.dart';
import '../theme/theme.dart';
import '../widgets/custom_text.dart';

void showSnackbar(
  BuildContext context, {
  String? message,
  SnackBarAction? snackBarAction,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeDiagonal * 2.0,
        right: SizeConfig.blockSizeDiagonal * 2.0,
        bottom: SizeConfig.blockSizeDiagonal * 2.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeDiagonal * 4.0,
        vertical: SizeConfig.blockSizeDiagonal * 1.5,
      ),
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
      backgroundColor: ApplicationTheme.grey,
      content: CustomText(
        maxLines: 3,
        text: message ?? Environment.genericError,
        color: ApplicationTheme.white,
        headLine: HeadLine.headLine5,
        //fontSize: 1.5,
        textAlign: TextAlign.center,
      ),
      action: snackBarAction,
      duration: duration ?? const Duration(milliseconds: 4000),
    ),
  );
}
