import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_app/model/post/register.dart';

class ApiHelper{
  
  static Future<Register> register(String url, {Map data}) async{
    return http.post(url, body: data).then((http.Response response){
      final statusCode = response.statusCode;

      if(statusCode != 200 || json == null){
        throw Exception('Failed to register');
      }
      return Register.fromJson(json.decode(response.body));
    });
  }
}