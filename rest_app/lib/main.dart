import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:developer';

import 'package:rest_app/route/mainRoute.dart';
import 'package:rest_app/model/post/register.dart';
import 'package:rest_app/model/post/login.dart';
import 'package:rest_app/helper/sharedPrefHelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => RegisterPage(title: 'RestApp',),
        '/login' : (context) => LoginPage(title: 'RestApp')
      },
    );
  }
}

class RegisterPage extends StatefulWidget {
  final String title;

  RegisterPage({Key key, this.title}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  static const _registerURL = 'http://10.0.2.2/resto/process/auth/register/register.php';

  final _userNameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();

  var isLoggedIn = false;

  SharedPreferencesHelper _sp;

  static TextStyle titleFormStyle = TextStyle(
    fontSize: 18,
    color: Colors.blueAccent.shade700,
  );

  static TextStyle toLoginTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black
  );

  void _register() async{
    Map registerData = Register.registerData(
      fullName: _fullNameController.text, 
      userName: _userNameController.text,
      password: _passwordController.text,
      level: "1"
    );

    Register registerResponse = await Register.register(_registerURL, registerData: registerData);

    if (registerResponse.isError == false) {

      SharedPreferencesHelper.insertBoolData(key: SharedPreferencesHelper.isLoggedInKey, value: true);
      moveToHome(context);
    }

  }

  static void moveToHome(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainRoute()));
  }

  Future<bool> checkSession() async{
    SharedPreferences sp = await SharedPreferences.getInstance();

    isLoggedIn = sp.getBool(SharedPreferencesHelper.isLoggedInKey);

    log('checkSession : $isLoggedIn');

    return isLoggedIn;
  }

  @override
  void initState(){
    super.initState();

    _sp = SharedPreferencesHelper();

    log('initState run');

    checkSession().then((onValue){
      log('initState : $onValue');
      if (onValue == true) {
        moveToHome(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16, right: 32, left: 32, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('FullName', style: titleFormStyle,),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: TextField(
                controller: _fullNameController,
              ),
            ),
            Text('UserName', style: titleFormStyle,),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: TextField(
                controller: _userNameController,
              ),
            ),
            Text('Password', style: titleFormStyle,),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 32),
              child: RaisedButton(
                child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20),),
                color: Colors.amberAccent.shade700,
                onPressed: _register,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Sudah punya akun? ', style: toLoginTextStyle,),
                  Text('login ', style: toLoginTextStyle,),
                  GestureDetector(
                    child: Text('disini', style: TextStyle(
                      fontSize: 16,
                      color: Colors.amber
                    )),
                    onTap: (){
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

class LoginPage extends StatefulWidget{
  final String title;

  LoginPage({Key key, this.title}) : super(key : key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  static const String _loginUrl = 'http://10.0.2.2/resto/process/auth/login/login.php';

  void _login() async{
    log('Login : {$_userNameController.text}');
    log('Login : {$_passwordController.text}');

    Map loginData = Login.loginData(
      userName: _userNameController.text,
      password: _passwordController.text
    );

    Login loginResponse = await Login.login(_loginUrl, loginData: loginData);

    if (loginResponse.isError == false) {
      _RegisterPageState.moveToHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16, right: 32, left: 32, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('UserName', style: _RegisterPageState.titleFormStyle,),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: TextField(
                controller: _userNameController,
              ),
            ),
            Text('Password', style: _RegisterPageState.titleFormStyle,),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 32),
              child: RaisedButton(
                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),),
                color: Colors.amberAccent.shade700,
                onPressed: _login,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Belum punya akun? ', style: _RegisterPageState.toLoginTextStyle,),
                  Text('daftar ', style: _RegisterPageState.toLoginTextStyle,),
                  GestureDetector(
                    child: Text('disini', style: TextStyle(
                      fontSize: 16,
                      color: Colors.amber
                    )),
                    onTap: (){
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}