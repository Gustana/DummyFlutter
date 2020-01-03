import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:rest_app/model/post/register.dart';

class ApiHelper{
  static Future<Register> register(String url, {Map data}) async{
    return http.post(url, body: data).then((http.Response response){
      final int statusCode = response.statusCode;

      if (statusCode != 200 || json == null) {
        throw Exception('Unable to register');
      }

      return Register.doRegister(json.decode(response.body));
    });
  }
}