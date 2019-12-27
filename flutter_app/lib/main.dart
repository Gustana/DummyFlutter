import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/helper/api_helper.dart';
import 'package:flutter_app/route/mainRoute.dart';
import 'package:flutter_app/model/post/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blueAccent
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {

  RegisterPage({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() => RegisterPageState();
  
}

class RegisterPageState extends State<RegisterPage>{

  Future<Register>  _registerUser;

  final appName = 'Flutter App';

  String _levelUser = 'Select Level';
  static const levelUserData = [
    'Select Level',
    'Owner',
    'Cashier',
    'Waiter',
    'Admin',
    'Costumer'
  ];

@override
  void initState() {
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text(appName)
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 64),
                  child: Center(
                    child: Text('RESTAPP',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40
                    ))
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 64, left: 64, right: 64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Full Name',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18
                        )),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Form(
                            key: Key('fullname'),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Full Name'
                              ),
                            ),
                          )
                        )
                      ]
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, left: 64, right: 64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Username',style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18
                        )),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Form(
                            key: Key('username'),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Username'
                              ),
                            ),
                          )
                        )
                      ]
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, left: 64, right: 64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Password', 
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                        )),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Form(
                            key: Key('password'),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password'
                              ),
                            ),
                          )
                        )
                      ]
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 64, left: 64, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Level',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                            ),
                          )
                        ),
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.0, 
                                style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0)
                              )
                            )
                          ),
                          margin: EdgeInsets.only(top: 8, left: 16),
                          width: 280,
                          child: Form(
                            key: Key('levelUser'),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: _levelUser,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                  items: levelUserData.map<DropdownMenuItem<String>>((String value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String data){
                                    setState(() {
                                      _levelUser = data;
                                    });
                                  },
                                )
                              )
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 64, bottom: 64),
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 200,
                        child: RaisedButton(
                          color: Colors.blueAccent,
                          splashColor: Colors.greenAccent,
                          onPressed: ()async{
                            //moveToHome(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Text('Login',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white
                            ))
                          )
                        ),
                      )
                    )
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}

void moveToHome(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context)=> MainRoute()
    ));
  }