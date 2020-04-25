import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whatsupworld/model/currency.dart';
import 'package:whatsupworld/model/news.dart';

class ApiCurrency {
  static const baseUrl = "http://data.fixer.io/api";
  static const key = "bfad3e160e21b7eab13fa70ac1f2db62";

  Future<Currency> getLatest() async {  
    final url = "$baseUrl/latest?access_key=$key&symbols=USD,GBP,JPY,CHF,CNY";    
    try {
      print("$url");
      http.Response response = await http.get(url);       
      return Currency.fromJson(json.decode(response.body));    

    } on Error catch (e) {      
      throw e;
    }
  }
}
