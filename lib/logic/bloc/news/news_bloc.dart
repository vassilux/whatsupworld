
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whatsupworld/model/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsupworld/repository/news_provider.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsProvider newsProvider;

  NewsBloc({@required this.newsProvider}) : assert(newsProvider != null);
  @override
  NewsState get initialState => NewsEmpty();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {    
    if (event is FetchNews) {
      yield* _mapFetchNewsToState(event);
    } else if (event is RefreshNews) {
      yield* _mapRefreshNewsToState(event);
    }
  }

  Stream<NewsState> _mapFetchNewsToState(FetchNews event) async* {
    yield NewsLoading();
    try {     
      var countryCode = "fr";      
      final news = await newsProvider.getCountryNews(countryCode);
      
      //
      yield NewsLoaded(news: news);
    } catch (_) {
      yield NewsError();
    }
  }

  Stream<NewsState> _mapRefreshNewsToState(RefreshNews event) async* {
    yield NewsLoading();
    try {     
      var countryCode = "fr";  
      final news = await newsProvider.getCountryNews(countryCode);      
      //
      yield NewsLoaded(news: news);
    } catch (_) {
      yield NewsError();
    }
  }
}