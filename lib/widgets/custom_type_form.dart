import 'package:flutter/material.dart';
import 'inputs/custom_checkbox_input.dart';
import 'inputs/custom_dropdown_input.dart';
import 'inputs/custom_input.dart';
import 'inputs/custom_input_profile.dart';

class CustomTypeForm extends StatelessWidget {
  final Map<String, dynamic> field;
  final Map<String, dynamic> formData;
  final VoidCallback canSetState;
  final double? spaceExternalLabel;
  final bool isCustomInputProfile;

  const CustomTypeForm({
    super.key,
    required this.field,
    required this.formData,
    required this.canSetState,
    this.spaceExternalLabel,
    this.isCustomInputProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    final String name = field['name'];
    final String? label = field['label'];
    final String type = field['type'];

    switch (type) {
      case 'text':
        return isCustomInputProfile
            ? CustomInputProfile(
                type: 'text',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                label: label,
                isExternalLabel: field['is_external_label'] ?? false,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              )
            : CustomInput(
                type: 'text',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                label: label,
                isExternalLabel: field['is_external_label'] ?? false,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              );
      case 'email':
        return isCustomInputProfile
            ? CustomInputProfile(
                type: 'email',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                label: label,
                isExternalLabel: field['is_external_label'] ?? false,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              )
            : CustomInput(
                type: 'email',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                label: label,
                isExternalLabel: field['is_external_label'] ?? false,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              );
      case 'password':
        return isCustomInputProfile
            ? CustomInputProfile(
                type: 'password',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                label: label,
                isExternalLabel: field['is_external_label'] ?? false,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              )
            : CustomInput(
                type: 'password',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                label: label,
                isExternalLabel: field['is_external_label'] ?? false,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              );
      case 'number':
        return isCustomInputProfile
            ? CustomInputProfile(
                type: 'number',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                isExternalLabel: field['is_external_label'] ?? false,
                label: label,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              )
            : CustomInput(
                type: 'number',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                isExternalLabel: field['is_external_label'] ?? false,
                label: label,
                name: name,
                textError: field['text_error'],
                isRequired: field['is_required'] ?? true,
                readOnly: field['read_only'] ?? false,
                readOnlyAlert: field['read_only_alert'],
              );
      case 'date':
        return isCustomInputProfile
            ? CustomInputProfile(
                type: 'date',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                isExternalLabel: field['is_external_label'] ?? false,
                label: label,
                name: name,
                textError: field['text_error'],
              )
            : CustomInput(
                type: 'date',
                spaceExternalLabel: spaceExternalLabel,
                formData: formData,
                isExternalLabel: field['is_external_label'] ?? false,
                label: label,
                name: name,
                textError: field['text_error'],
              );
      case 'dropdown':
        return CustomDropdownInput(
          spaceExternalLabel: spaceExternalLabel,
          formData: formData,
          label: label,
          isExternalLabel: field['is_external_label'] ?? false,
          name: name,
          textError: field['text_error'],
          data: field,
        );
      case 'checkbox':
        return CustomCheckboxInput(
          spaceExternalLabel: spaceExternalLabel,
          formData: formData,
          label: label,
          isExternalLabel: field['is_external_label'] ?? false,
          name: name,
          textError: field['text_error'],
          data: field,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
