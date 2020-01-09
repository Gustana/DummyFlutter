import 'package:flutter/material.dart';

class MainRoute extends StatefulWidget{

  MainRoute({Key key}): super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();

}

class _MainRouteState extends State<MainRoute>{

  int _selectedIndex = 0;  

  @override
  void initState(){
    super.initState();

  }

  @override
  void dispose(){
    super.dispose();
  }

  void _onItemSelected(int index){
    setState(() {
      _selectedIndex =  index;
    });
  }

  static const TextStyle btmNavTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetPage = <Widget>[
    Container(
      margin: EdgeInsets.only(top: 8, right: 8, left: 8),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Image.asset('assets/food.jpg', width: 125, height: 100,)
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Mie Goreng', style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent
                      )),
                      Text('|', style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20
                      )),
                      Text('Tersedia', style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent
                      ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Rp. ', style: TextStyle(
                          fontSize: 18
                        )),
                        Text('40,000', style: TextStyle(
                          fontSize: 18
                        ))
                      ],
                    )
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 170, maxWidth: 180),
                    child: Text('Mie dengan sayur dan kacang rebus', style: TextStyle(
                      fontSize: 18
                    ))
                  )
                ],
              )
            )
          ],
        )
      )
    ),
    Text('sdf'),
    Text('dsf')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text('Flutter App')
      ),
      body : _widgetPage.elementAt(_selectedIndex),
      // _widgetPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text('Menu')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Report')
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemSelected,
      ),
    );
  }

}