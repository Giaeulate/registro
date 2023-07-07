import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/theme.dart';
import '../../utils/custom_alerts.dart';
import '../../utils/date_utils.dart';
import '../custom_text.dart';

class CustomInputProfile extends StatefulWidget {
  final String? label;
  final String type;
  final String name;
  final Map<String, dynamic> formData;
  final bool isRequired;
  final String? textError;
  final bool isDouble;
  final bool isExternalLabel;
  final double? spaceExternalLabel;
  final bool showIcons;
  final bool readOnly;
  final String? readOnlyAlert;

  const CustomInputProfile({
    super.key,
    this.label,
    this.type = 'text',
    required this.name,
    required this.formData,
    this.isRequired = true,
    this.textError,
    this.isDouble = false,
    this.isExternalLabel = false,
    this.spaceExternalLabel,
    this.showIcons = true,
    this.readOnly = false,
    this.readOnlyAlert,
  });

  @override
  State<CustomInputProfile> createState() => _CustomInputProfileState();
}

class _CustomInputProfileState extends State<CustomInputProfile> {
  bool showText = false;
  DateTime? selectedDate;
  final focusNode = FocusNode();

  TextInputType _getKeyboardType(String type) {
    switch (type) {
      case 'text':
        return TextInputType.text;
      case 'number':
        return TextInputType.number;
      case 'email':
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  _getValidator(String type, String? value) {
    switch (type) {
      case 'date':
        if (value == null ||
            value.isEmpty ||
            widget.formData[widget.name] == null ||
            widget.formData[widget.name].toString().isEmpty) {
          return widget.textError ?? 'Este campo es obligatorio';
        }
        return null;
      case 'datetime':
        if (value == null ||
            value.isEmpty ||
            widget.formData[widget.name] == null ||
            widget.formData[widget.name].toString().isEmpty) {
          return widget.textError ?? 'Este campo es obligatorio';
        }
        return null;
      case 'email':
        if (value == null || value.isEmpty) {
          return widget.textError ?? 'Este campo es obligatorio';
        }
        widget.formData[widget.name] = value;
        return null;
      case 'number':
        if (value == null || value.isEmpty) {
          return widget.textError ?? 'Este campo es obligatorio';
        }
        if (widget.isDouble && double.tryParse(value) == null) {
          return 'Este campo debe ser numérico';
        }
        if (!widget.isDouble && int.tryParse(value) == null) {
          return 'Este campo debe ser numérico';
        }

        widget.formData[widget.name] =
            widget.isDouble ? double.parse(value) : int.parse(value);
        return null;
      case 'password':
        if (value == null || value.isEmpty) {
          return widget.textError ?? 'Este campo es obligatorio';
        }
        widget.formData[widget.name] = value;
        return null;
      default:
        if (value == null || value.isEmpty) {
          return widget.textError ?? 'Este campo es obligatorio';
        }
        widget.formData[widget.name] = value;
        return null;
    }
  }

  String getTypeText(String type) {
    switch (type) {
      case 'date':
      case 'datetime':
        return widget.formData[widget.name] != null
            ? dateToDateStringUtils(widget.formData[widget.name])
            : "";
      case 'email':
        return widget.formData[widget.name] ?? '';
      case 'number':
        return widget.formData[widget.name] != null
            ? '${widget.formData[widget.name]}'
            : '';
      default:
        return widget.formData[widget.name] ?? '';
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
        TextFormField(
          focusNode: focusNode,
          obscureText: widget.type == 'password' && !showText,
          controller: TextEditingController(
            text: getTypeText(widget.type),
          ),
          onChanged: (value) {
            widget.formData[widget.name] = value;
          },
          style: getStyle(HeadLine.headLine4)!.copyWith(
            fontWeight: FontWeight.bold,
            color: ApplicationTheme.black,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.type == 'password' && widget.showIcons
                ? GestureDetector(
                    child: Icon(
                      showText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onTap: () => setState(() {
                      showText = !showText;
                    }),
                  )
                : null,
            filled: true,
            fillColor: const Color(0xffF1F1F1),
            label: !widget.isExternalLabel && widget.label != null
                ? Container(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 5, right: 10),
                    decoration: BoxDecoration(
                      color: ApplicationTheme.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CustomText(
                      text: '${widget.label}',
                      headLine: HeadLine.headLine2,
                    ),
                  )
                : null,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
          readOnly: !widget.readOnly
              ? (widget.type == 'date' || widget.type == 'datetime')
              : widget.readOnly,
          onTap: () async {
            if (widget.readOnly && widget.readOnlyAlert != null) {
              showCustomAlert(context, widget.readOnlyAlert!);
              return;
            }
            if (widget.type == 'date' || widget.type == 'datetime') {
              DateTime? pickedDate;
              pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(DateTime.now().year - 20),
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime.now(),
              );

              if (pickedDate == null) return;
              selectedDate = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
              );
              widget.formData[widget.name] = selectedDate;
              if (mounted) {
                setState(() {});
              }
            }
          },
          onSaved: (value) => widget.formData[widget.name] = value,
          keyboardType: _getKeyboardType(widget.type),
          inputFormatters: [
            if (widget.type == 'number') FilteringTextInputFormatter.digitsOnly,
          ],
          validator: widget.isRequired
              ? (value) => _getValidator(widget.type, value)
              : null,
        ),
      ],
    );
  }
}
