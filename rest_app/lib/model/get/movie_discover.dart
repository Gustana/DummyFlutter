import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class MovieDiscover{
  static Future<dynamic> getMovieDiscover(url, {Map<String, dynamic> headers}) async{
    var response = await http.get(url, headers: headers);
    
    if (response.statusCode != 200) {
      throw Exception('Failed to get Movie Discover');
    }

    var bodyResponse = response.body;

    log('getMovieDiscover : $bodyResponse');

    return json.decode(response.body);
  }
}