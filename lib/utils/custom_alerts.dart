import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'size_config.dart';

void showBottomAlert(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return child;
    },
  );
}

showCustomAlert(
  BuildContext context,
  String title, {
  bool showIcon = true,
  String? subtitle,
  Function()? onPressed,
  backgroundColor,
  textColor,
  String? buttonText,
  Widget? childBody,
  Widget? childTitle,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: backgroundColor,
      title: childTitle ??
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeDiagonal * 2,
                ),
                text: title,
                textAlign: TextAlign.center,
                headLine: HeadLine.headLine4,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
      content: SingleChildScrollView(
        child: childBody ??
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (subtitle != null)
                  CustomText(
                    text: subtitle,
                    textAlign: TextAlign.center,
                    headLine: HeadLine.headLine5,
                  ),
                CustomButton(
                  text: buttonText ?? "Aceptar",
                  onPressed: () {
                    if (onPressed != null) {
                      Navigator.pop(context);
                      onPressed();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
      ),
      // actions: [
      //   Center(
      //     child: MaterialButton(
      //       elevation: 5,
      //       textColor: textColor,
      //       onPressed: () {
      //         if (onPressed != null) {
      //           Navigator.pop(context);
      //           onPressed();
      //         } else {
      //           Navigator.pop(context);
      //         }
      //       },
      //       child: CustomText(
      //         text: buttonText ?? "Aceptar",
      //         textAlign: TextAlign.start,
      //       ),
      //     ),
      //   ),
      // ],
    ),
  );
}

showCustomQuestionAlert(
  BuildContext context,
  String title, {
  bool showIcon = true,
  String? subtitle,
  Function()? onPressedRejected,
  Function()? onPressedAccepted,
  backgroundColor,
  textColor,
  String? buttonRejectedText,
  String? buttonAcceptedText,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: backgroundColor,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            padding: EdgeInsets.only(
              top: showIcon ? SizeConfig.blockSizeDiagonal * 2 : 0,
            ),
            text: title,
            textAlign: TextAlign.center,
            headLine: HeadLine.headLine4,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (subtitle != null)
              CustomText(
                text: subtitle,
                textAlign: TextAlign.center,
                headLine: HeadLine.headLine5,
              ),
            // CustomButton(
            //   text: buttonText ?? "Aceptar",
            //   onPressed: () {
            //     if (onPressed != null) {
            //       Navigator.pop(context);
            //       onPressed();
            //     } else {
            //       Navigator.pop(context);
            //     }
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  elevation: 5,
                  textColor: textColor,
                  onPressed: () {
                    if (onPressedRejected != null) {
                      Navigator.pop(context);
                      onPressedRejected();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: CustomText(
                    text: buttonRejectedText ?? "No",
                    textAlign: TextAlign.start,
                    color: ApplicationTheme.primary,
                  ),
                ),
                MaterialButton(
                  elevation: 5,
                  textColor: textColor,
                  onPressed: () {
                    if (onPressedAccepted != null) {
                      Navigator.pop(context);
                      onPressedAccepted();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: CustomText(
                    text: buttonAcceptedText ?? "SI",
                    textAlign: TextAlign.start,
                    color: ApplicationTheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // actions: [
      //   MaterialButton(
      //     elevation: 5,
      //     textColor: textColor,
      //     onPressed: () {
      //       if (onPressedRejected != null) {
      //         Navigator.pop(context);
      //         onPressedRejected();
      //       } else {
      //         Navigator.pop(context);
      //       }
      //     },
      //     child: CustomText(
      //       text: buttonRejectedText ?? "No",
      //       textAlign: TextAlign.start,
      //       color: ApplicationTheme.primary,
      //     ),
      //   ),
      //   MaterialButton(
      //     elevation: 5,
      //     textColor: textColor,
      //     onPressed: () {
      //       if (onPressedAccepted != null) {
      //         Navigator.pop(context);
      //         onPressedAccepted();
      //       } else {
      //         Navigator.pop(context);
      //       }
      //     },
      //     child: CustomText(
      //       text: buttonAcceptedText ?? "SI",
      //       textAlign: TextAlign.start,
      //       color: ApplicationTheme.primary,
      //     ),
      //   ),
      // ],
    ),
  );
}
