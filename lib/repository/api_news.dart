import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whatsupworld/model/news.dart';

class ApiNews {
  static const baseUrl = "https://newsapi.org/v2/top-headlines";
  static const key = "be754f58488c43649dcfdef49f77d150";

  Future<News> getCountryNews(String countryCode) async {          
    final url = "$baseUrl?country=$countryCode&apiKey=be754f58488c43649dcfdef49f77d150";
    
    try {
      print("$url");
      http.Response response = await http.get(url);       
      return News.fromJson(json.decode(response.body));    

    } on Error catch (e) {      
      throw e;
    }
  }
}
