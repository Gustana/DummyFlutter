import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Register{
  final bool isError;
  final String message;

  Register({this.isError, this.message});
  
  factory Register.doRegister(Map<String, dynamic> data){
    var registerResponse = data['serverResponse'];

    log('$registerResponse');

    return Register(
      isError: registerResponse['isError'],
      message: registerResponse['message']
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
    return http.post(url, body: registerData).then((http.Response response){
      final int statusCode = response.statusCode;

      var responseBody = response.body;

      log('statusCode : $statusCode');
      log('responseBody : $responseBody');

      if (statusCode != 200 || json == null) {
        throw Exception('Failed to register');
      }

      return Register.doRegister(json.decode(response.body));
    });
    // var apiResult = await http.post(url, body: registerData);

    // if (apiResult.statusCode != 200 || json == null) {
    //   throw Exception('Failed to register');
    // }

    // var registerResponse = json.decode(apiResult.body);

    // log('RegisterResponse : $registerResponse');

    // var register = Register.doRegister(registerResponse);

    // log('$register');

    // return register;
  }
}