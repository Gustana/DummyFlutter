import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Register{
  final bool isError;
  final String message;

  Register({this.isError, this.message});
  
  factory Register.doRegister(Map<String, dynamic> json){
    return Register(
      isError: json['isError'],
      message: json['message']
    );
  }

  static Map registerData({String fullName, String userName, String password, String level}){

    Map<String, dynamic> data = Map();

    data['fullName'] = fullName;
    data['userName'] = userName;
    data['password'] = password;
    data['level'] = level;

    return data;
  }

  static Future<Register> register(String url, {Map registerData}) async{

    final apiResult = await http.post(url, body: registerData);

    if (apiResult.statusCode != 200 || json == null) {
      throw Exception('Failed to register');
    }

    final registerResponse = json.decode(apiResult.body);

    return Register.doRegister(registerResponse);
  }
}