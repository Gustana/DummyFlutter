import 'package:flutter/material.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  final appName = 'Flutter App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Center(
          child: Text(appName)
        ),
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
          ],
        )
      ),
    );
  }
}
