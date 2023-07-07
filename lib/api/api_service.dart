// ignore: depend_on_referenced_packages
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import '../global/environment.dart';

Future<dynamic> postApi(String url, dynamic data, {dynamic headers}) async {
  final http.Response response = await http.post(
    Uri.parse('${Environment.url}/$url'),
    headers: headers ?? {'Content-Type': 'application/json'},
    body: data != null ? jsonEncode(data) : null,
  );
  // log(url);
  // log("reponse: ${response.body}");
  // log("reponse: ${response.statusCode}");
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (response.statusCode >= 500) {
      return {
        "status": false,
        "message": "Ocurrió un error por nuestro lado, disculpa las molestias"
      };
    }
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}

Future<dynamic> putApi(String url, String id, dynamic data,
    {dynamic headers}) async {
  final http.Response response = await http.put(
    Uri.parse('${Environment.url}/$url/$id/'),
    headers: headers ?? {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (response.statusCode >= 500) {
      return {
        "status": false,
        "message": "Ocurrió un error por nuestro lado, disculpa las molestias"
      };
    }
    throw ErrorDescription(response.body.toString());
  }
}

Future<dynamic> getApi(String url, {dynamic headers}) async {
  final http.Response response = await http.get(
    Uri.parse('${Environment.url}/$url'),
    headers: headers ?? {'Content-Type': 'application/json'},
  );
  // log('${Environment.url}/$url');
  // log('${response.statusCode}');
  // log('${response.body}');
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (response.statusCode >= 500) {
      return {
        "status": false,
        "message": "Ocurrió un error por nuestro lado, disculpa las molestias"
      };
    }
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}
