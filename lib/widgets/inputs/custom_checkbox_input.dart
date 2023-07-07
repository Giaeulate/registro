import 'package:flutter/material.dart';
import '../custom_text.dart';

class CustomCheckboxInput extends StatefulWidget {
  final Map<String, dynamic> data;
  final String? label;
  final String name;
  final Map<String, dynamic> formData;
  final bool isRequired;
  final String? textError;
  final bool isExternalLabel;
  final double? spaceExternalLabel;

  const CustomCheckboxInput({
    super.key,
    required this.data,
    this.label,
    required this.name,
    required this.formData,
    this.isRequired = true,
    this.textError,
    this.isExternalLabel = false,
    this.spaceExternalLabel,
  });

  @override
  State<CustomCheckboxInput> createState() => _CustomCheckboxInputState();
}

class _CustomCheckboxInputState extends State<CustomCheckboxInput> {
  void canSetState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.isExternalLabel
            ? CustomText(text: widget.label ?? "", headLine: HeadLine.headLine3)
            : const SizedBox(),
        SizedBox(height: widget.spaceExternalLabel ?? 0.0),
        ...widget.data['options']
                ?.map<Widget>((option) => CheckboxListTile(
                      title: CustomText(text: option['label']),
                      value: widget.formData[widget.name]
                              ?.contains(option['value']) ??
                          false,
                      onChanged: (value) {
                        final List<dynamic>? currentValue =
                            widget.formData[widget.name];
                        if (value!) {
                          widget.formData[widget.name] = [
                            ...currentValue ?? [],
                            option['value']
                          ];
                          canSetState();
                        } else {
                          widget.formData[widget.name] = currentValue
                              ?.where((element) => element != option['value'])
                              .toList();
                          canSetState();
                        }
                      },
                    ))
                .toList() ??
            []
      ],
    );
  }
}
