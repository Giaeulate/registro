import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'size_config.dart';

showPopup(
    {required BuildContext context,
    required String title,
    required String description,
    required String imageUrl,
    required String buttonBack,
    required VoidCallback buttomFunction}) async {
  //final words = AppLocalizations.of(context)!;

  return showDialog(
      useRootNavigator: false,
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: ApplicationTheme.red,
          contentPadding:
              const EdgeInsets.only(bottom: 1, top: 0, left: 0, right: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          // titlePadding: const EdgeInsets.only(top: 20),
          title: CustomText(
            text: title,
            headLine: HeadLine.headLine4,
            textAlign: TextAlign.center,
            color: ApplicationTheme.white,
            //fontSize,
            fontWeight: FontWeight.bold,
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
            height: SizeConfig.blockSizeDiagonal * 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  headLine: HeadLine.headLine5,
                  text: description,
                  textAlign: TextAlign.center,
                  color: ApplicationTheme.white,
                  //fontSize,
                  maxLines: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    left: 8,
                    right: 8,
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(
                      onPressed: buttomFunction,
                      text: buttonBack,
                      textColor: ApplicationTheme.white,
                      backgroundColor: ApplicationTheme.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

showguestCheck({
  required BuildContext context,
}) async {
  //final words = AppLocalizations.of(context)!;

  return showDialog(
      useRootNavigator: false,
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ApplicationTheme.white,
          contentPadding:
              const EdgeInsets.only(bottom: 1, top: 0, left: 0, right: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titlePadding: const EdgeInsets.only(top: 20),
          title: CustomText(
            text: 'Debes iniciar sesión',
            headLine: HeadLine.headLine4,
            textAlign: TextAlign.center,
            color: ApplicationTheme.red,
            //fontSize,
            fontWeight: FontWeight.bold,
          ),
          content: SizedBox(
            height: SizeConfig.blockSizeDiagonal * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/png/shopping_empty.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    headLine: HeadLine.headLine5,
                    text: "Para esta acción se requiere iniciar sesión",
                    textAlign: TextAlign.center,
                    color: ApplicationTheme.red,
                    //fontSize,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "Ir al inicio de sesión",
                      textColor: ApplicationTheme.white,
                      backgroundColor: ApplicationTheme.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

confirmAction(
    {required BuildContext context,
    required String title,
    required String description,
    required String confirmButtonText,
    required VoidCallback confirmFunction}) async {
  //final words = AppLocalizations.of(context)!;

  return showDialog(
      useRootNavigator: false,
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ApplicationTheme.white,
          contentPadding:
              const EdgeInsets.only(bottom: 1, top: 0, left: 0, right: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          //titlePadding: const EdgeInsets.only(top: 20),
          title: CustomText(
            text: title,
            headLine: HeadLine.headLine4,
            textAlign: TextAlign.center,
            color: ApplicationTheme.red,
            //fontSize,
            fontWeight: FontWeight.bold,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  headLine: HeadLine.headLine5,
                  text: description,
                  textAlign: TextAlign.center,
                  color: ApplicationTheme.red,
                  //fontSize,
                  maxLines: 5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeDiagonal * 1.5),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          confirmFunction();
                          Navigator.pop(context);
                        },
                        text: confirmButtonText,
                        textColor: ApplicationTheme.white,
                        backgroundColor: ApplicationTheme.red,
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeDiagonal * 1),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Cancelar",
                        textColor: ApplicationTheme.white,
                        backgroundColor: ApplicationTheme.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeDiagonal * 2),
            ],
          ),
        );
      });
}
