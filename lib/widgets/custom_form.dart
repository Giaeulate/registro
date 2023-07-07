import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'custom_button.dart';
import 'custom_type_form.dart';

class CustomForm extends StatefulWidget {
  final List<Map<String, dynamic>> json;
  final String textButton;
  final Color? textColor;
  final double space;
  final double? spaceExternalLabel;
  final EdgeInsets? padding;
  final Function(dynamic value)? onPressed;
  final List<Widget> extraFields;
  final bool hasButton;
  final Map<String, dynamic>? formData;
  final GlobalKey<FormState>? formKey;
  final bool isCustomInputProfile;

  const CustomForm({
    super.key,
    required this.json,
    this.textButton = 'Continuar',
    this.textColor,
    this.space = 0.0,
    this.spaceExternalLabel,
    this.padding,
    this.onPressed,
    this.extraFields = const [],
    this.hasButton = true,
    this.formData,
    this.formKey,
    this.isCustomInputProfile = false,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void canSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey ?? _formKey,
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            ...widget.json.map<Widget>(
              (field) {
                var column = Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTypeForm(
                      isCustomInputProfile: widget.isCustomInputProfile,
                      spaceExternalLabel: widget.spaceExternalLabel,
                      field: field,
                      formData: widget.formData ?? _formData,
                      canSetState: canSetState,
                    ),
                  ],
                );
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: widget.space,
                  ),
                  child: column,
                );
              },
            ).toList(),
            ...widget.extraFields.toList(),
            if (widget.hasButton)
              CustomButton(
                text: widget.textButton,
                onPressed: widget.onPressed != null
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          widget.onPressed!(_formData);
                        }
                      }
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
