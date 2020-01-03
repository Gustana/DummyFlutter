import 'package:flutter/material.dart';

import 'package:rest_app/route/mainRoute.dart';
import 'package:rest_app/model/post/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'RestApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const _registerURL = 'http://10.0.2.2/resto/process/auth/register/register.php';

  var _userNameController = TextEditingController();
  var _fullNameController = TextEditingController();
  var _passwordController = TextEditingController();

  var titleFormStyle = TextStyle(
    fontSize: 18,
    color: Colors.blueAccent.shade700,
  );

  void register() async{
    Map registerData = Register.registerData(
      fullName: _fullNameController.text, 
      userName: _userNameController.text,
      password: _passwordController.text,
      level: "1"
    );

    Register registerResponse = await Register.register(_registerURL, registerData: registerData);

    if (registerResponse.isError == false) {
      moveToHome(context);
    }

  }

  void moveToHome(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => MainRoute()
    ));
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
                onPressed: register,
              ),
            )
          ],
        )
      ),
    );
  }
}
