
import 'package:flutter/material.dart';
import 'package:whatsupworld/model/news.dart';

import 'api_news.dart';

class NewsProvider {  
  final ApiNews apiNews;

  NewsProvider({@required this.apiNews}): assert(apiNews != null);
 

  Future<News> getCountryNews(String countryCode) async {
    return apiNews.getCountryNews(countryCode);
  }

}