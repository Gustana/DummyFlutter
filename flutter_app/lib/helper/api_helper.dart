import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_app/model/post/register.dart';

class ApiHelper{
  static Future<Register> register() async{
    final registerResponse = await http.get('http://localhost/resto/process/auth/register/register.php');

    if(registerResponse.statusCode == 200){
      return Register.fromJson(json.decode(registerResponse.body));
    }else{
      throw Exception('Failed to register');
    }
  }
}