part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNews extends NewsEvent {
  @override
  List<Object> get props => [];
}

class RefreshNews extends NewsEvent {
  @override
  List<Object> get props => [];
}