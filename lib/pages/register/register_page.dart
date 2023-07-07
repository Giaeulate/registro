import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registro_datos/utils/custom_will_pop_scope.dart';
import 'package:registro_datos/widgets/custom_button.dart';

import '../../model/municipio_model.dart';
import '../../utils/size_config.dart';
import '../../widgets/custom_form.dart';
import '../../widgets/custom_photo_select.dart';
import '../../widgets/inputs/custom_dropdown_input.dart';

class RegisterPage extends StatefulWidget {
  static const route = 'register_page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Map<String, dynamic> formData = {};
  final List<Map<String, dynamic>> _jsonData = [
    {
      "name": "name",
      "label": "Nombre:",
      "error_text": "Debe completar este campo",
      "is_external_label": true,
      "type": "text",
      'is_required': true,
    },
    {
      "name": "document",
      "label": "C.I.:",
      "error_text": "Debe completar este campo",
      "is_external_label": true,
      "type": "number",
      'is_required': true,
    }
  ];

  File? _photo;
  File? _photo2;
  final ImagePicker _picker = ImagePicker();

  canState() {
    if (mounted) {
      setState(() {});
    }
  }

  _takePicture() async {
    await _picker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    )
        .then(
      (value) async {
        if (value != null) {
          setState(() {
            _photo = File(value.path);
          });
        }
        return value;
      },
    );
  }
  _takePicture2() async {
    await _picker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    )
        .then(
      (value) async {
        if (value != null) {
          setState(() {
            _photo2 = File(value.path);
          });
        }
        return value;
      },
    );
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  List<MunicipioModel> _municipios = [];
  List<Map<String, dynamic>> _comunidades = [];
  String _currentMunicipio = "";

  _initData() async {
    final dataJson = await rootBundle.loadString('assets/json/municipio.json');
    final data = jsonDecode(dataJson) as List;
    _municipios = data.map((e) => MunicipioModel.fromJson(e)).toList();
    canState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomWillPopScope(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // CustomDropdownInput(
                  //   data: {
                  //     "options": [
                  //       ..._municipios
                  //           .map((e) => {"value": e.id, "label": e.name})
                  //           .toList()
                  //     ],
                  //   },
                  //   formData: formData,
                  //   name: "municipio",
                  //   isExternalLabel: true,
                  //   label: 'Municipio:',
                  //   isRequired: false,
                  //   onChanged: (value) {
                  //     _currentMunicipio = value;
                  //     formData["comunidad"] = null;
                  //     _comunidades.clear();
                  //     _comunidades = _municipios
                  //         .where((e) => e.id == _currentMunicipio)
                  //         .first
                  //         .comunidades
                  //         .map((com) => {"value": com, "label": com})
                  //         .toList();
                  //     canState();
                  //   },
                  // ),
                  // CustomDropdownInput(
                  //   data: {
                  //     "options": _comunidades,
                  //   },
                  //   formData: formData,
                  //   name: "comunidad",
                  //   isExternalLabel: true,
                  //   label: 'Comunidad:',
                  //   isRequired: false,
                  //   onChanged: (value) {
                  //     canState();
                  //   },
                  // ),
                  // CustomForm(
                  //   space: SizeConfig.blockSizeDiagonal * 1,
                  //   json: _jsonData,
                  //   hasButton: false,
                  //   formData: formData,
                  // ),
                  // CustomPhotoSelect(
                  //   isPhotoFile: true,
                  //   urlImage: null,
                  //   marginBottom: SizeConfig.blockSizeDiagonal * 3,
                  //   photo: _photo,
                  //   takePicture: () => _takePicture(),
                  // ),
                  // CustomPhotoSelect(
                  //   isPhotoFile: true,
                  //   urlImage: null,
                  //   marginBottom: SizeConfig.blockSizeDiagonal * 3,
                  //   photo: _photo2,
                  //   takePicture: () => _takePicture2(),
                  // ),
                  CustomButton(
                    text: "Encuestas",
                    onPressed: (){},
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(height: 12,),
                  CustomButton(
                    text: "Campo",
                    onPressed: (){},
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
