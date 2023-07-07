import 'package:flutter/material.dart';
import 'package:registro_datos/theme/theme.dart';
import '../custom_text.dart';

class CustomDropdownInput extends StatelessWidget {
  final Map<String, dynamic> data;
  final String? label;
  final String name;
  final Map<String, dynamic> formData;
  final bool isRequired;
  final String? textError;
  final bool isExternalLabel;
  final double? spaceExternalLabel;
  final Function(dynamic value)? onChanged;

  const CustomDropdownInput({
    super.key,
    required this.data,
    this.label,
    required this.name,
    required this.formData,
    this.isRequired = true,
    this.textError,
    this.isExternalLabel = false,
    this.spaceExternalLabel,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<dynamic>? options = data['options'];
    final List<DropdownMenuItem<String>> dropdownOptions = options
            ?.map((option) => DropdownMenuItem<String>(
                  value: option['value'],
                  child: CustomText(text: option['label']),
                ))
            .toList() ??
        [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        isExternalLabel
            ? CustomText(text: label ?? "", headLine: HeadLine.headLine3)
            : const SizedBox(),
        SizedBox(height: spaceExternalLabel ?? 0.0),
        DropdownButtonFormField<String>(
          iconSize: 0,
          decoration: InputDecoration(
            label: !isExternalLabel && label != null
                ? CustomText(text: '$label', headLine: HeadLine.headLine3)
                : null,
            focusedBorder: ApplicationTheme.focusBorder,
            border: ApplicationTheme.disableBorder,
          ),
          items: dropdownOptions,
          // onChanged: (value) => formData[name] = value,
          onChanged: (value) {
            formData[name] = value;
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          onSaved: (value) => formData[name] = value,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return textError ?? 'Este campo es obligatorio';
          //   }
          //   return null;
          // },
        ),
      ],
    );
  }
}
