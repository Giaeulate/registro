import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class CustomWillPopScope extends StatelessWidget {
  final Widget child;
  final VoidCallback? onWillPop;

  const CustomWillPopScope({
    super.key,
    required this.child,
    this.onWillPop,
  });
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!Navigator.canPop(context)) {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const CustomText(text: '¿Desea salir de la aplicación?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const CustomText(text: 'Cancelar'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const CustomText(text: 'Salir'),
                  ),
                ],
              );
            },
          );
        }
        if (onWillPop != null) {
          onWillPop!();
        }
        return true;
      },
      child: child,
    );
  }
}
