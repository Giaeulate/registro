import 'dart:convert';

MunicipioModel municipioModelFromJson(String str) => MunicipioModel.fromJson(json.decode(str));

String municipioModelToJson(MunicipioModel data) => json.encode(data.toJson());

class MunicipioModel {
    String id;
    String name;
    List<String> comunidades;

    MunicipioModel({
        required this.id,
        required this.name,
        required this.comunidades,
    });

    factory MunicipioModel.fromJson(Map<String, dynamic> json) => MunicipioModel(
        id: json["id"],
        name: json["name"],
        comunidades: List<String>.from(json["comunidades"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "comunidades": List<dynamic>.from(comunidades.map((x) => x)),
    };
}
