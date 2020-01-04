import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

class Login{
  final isError;
  final message;

  Login({this.isError, this.message});

  factory Login._doLogin(Map<String, dynamic> data){
    var loginResponse = data['serverResponse'];

    log('doLogin : $loginResponse');

    return Login(
      isError: loginResponse['isError'],
      message: loginResponse['message']
    );
  }

  static Map loginData({String userName, String password}){
    Map<String, dynamic> data = Map();

    data['username'] = userName;
    data['password'] = password;

    return data;
  }

  static Future<Login> login(String url, {Map loginData}) async{
    return http.post(url, body: loginData).then((http.Response response){
      final int statusCode = response.statusCode;

      var responseBody = response.body;

      log('login : $responseBody');
      
      if (statusCode != 200) {
        throw Exception('Failed to login');
      }

      return Login._doLogin(json.decode(responseBody));
    });
  }
}