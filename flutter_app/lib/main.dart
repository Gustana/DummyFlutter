import 'package:flutter/material.dart';
import 'route/mainRoute.dart';

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

class RegisterPage extends StatelessWidget {

  static final appName = 'Flutter App';

  void moveToHome(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context)=> MainRoute()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text(appName)
      ),
      body: Container(
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
                  Text('Username',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18
                  )),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'gustana'
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
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'password',
                        ),
                      ),
                    )
                  )
                ]
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              child: Center(
                child: FlatButton(
                  color: Colors.blueAccent,
                  splashColor: Colors.greenAccent,
                  onPressed: (){moveToHome(context);
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
          ],
        ),
      ),
    );
  }
}
