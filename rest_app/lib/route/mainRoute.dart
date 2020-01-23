import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:rest_app/model/get/movie_discover.dart';

class MainRoute extends StatefulWidget{

  MainRoute({Key key}): super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();

}

class _MainRouteState extends State<MainRoute>{

  static const api_key = 'ed23cd01449c143cdc425f18c753d315';
  static const base_url = 'api.themoviedb.org';

  int _selectedIndex = 0;

  static Map<String, dynamic> _movieData;

  @override
  void initState(){
    getMovieDiscover();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text('Flutter App')
      ),
      body : _widgetPage.elementAt(_selectedIndex),      
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

    void _onItemSelected(int index){
      setState(() {
        _selectedIndex =  index;
      }); 
  }

  void getMovieDiscover() async{
    try{
      final discoverMovieUrl = Uri.https(base_url, '/3/discover/movie', {
        'api_key' : api_key,
        'language' : 'en-US',
        'sort_by' : 'popularity.desc',
        'page' : '1'
      });
      var data = await MovieDiscover.getMovieDiscover(discoverMovieUrl, headers: null);
      if (mounted) {
        log('mounted');

        setState(() {
          _movieData = data;

          log('getMovieDiscover : $_movieData');
        }); 
      }
    }catch(error){
      log('getMovieDiscover error : $error');
    }
  }

  static const TextStyle btmNavTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetPage = <Widget>[
    ListView.builder(
      itemCount: _movieData.length,
      itemBuilder: (context, position){
        return Container(
          margin: EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Card(
            child: Text(_movieData['results'][position]),
          ),
        );
      },
    ),
    // Container(
    //   margin: EdgeInsets.only(top: 8, right: 8, left: 8),
    //   child: Card(
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Container(
    //           padding: EdgeInsets.all(16),
    //           child: Image.asset('assets/food.jpg', width: 125, height: 100,)
    //         ),
    //         Container(
    //           padding: EdgeInsets.all(16),
    //           margin: EdgeInsets.only(top: 8),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: <Widget>[
    //               Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: <Widget>[
    //                   Text('Mie Goreng', style: TextStyle(
    //                     fontSize: 25,
    //                     color: Colors.blueAccent
    //                   )),
    //                   Text('|', style: TextStyle(
    //                     color: Colors.grey.shade500,
    //                     fontSize: 20
    //                   )),
    //                   Text('Tersedia', style: TextStyle(
    //                     fontSize: 15,
    //                     color: Colors.blueAccent
    //                   ))
    //                 ],
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(top: 8),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: <Widget>[
    //                     Text('Rp. ', style: TextStyle(
    //                       fontSize: 18
    //                     )),
    //                     Text('40,000', style: TextStyle(
    //                       fontSize: 18
    //                     ))
    //                   ],
    //                 )
    //               ),
    //               Container(
    //                 constraints: BoxConstraints(minWidth: 170, maxWidth: 180),
    //                 child: Text('Mie dengan sayur dan kacang rebus', style: TextStyle(
    //                   fontSize: 18
    //                 ))
    //               )
    //             ],
    //           )
    //         )
    //       ],
    //     )
    //   )
    // ),
    Text('sdf'),
    Text('dsf')
  ];

}