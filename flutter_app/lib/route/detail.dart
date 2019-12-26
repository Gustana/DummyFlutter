import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text('Flutter App')
      ),
      body : Container(
        margin: EdgeInsets.only(top: 8, right: 16, left: 16),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Image.asset('assets/food.jpg', width: 125, height: 100,)
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  children: <Widget>[
                    Text('Mie Goreng', style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent
                    ))
                  ],
                )
              )
            ],
          )
        )
      )
    );
  }

}