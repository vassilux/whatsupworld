part of 'news_bloc.dart';
abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsEmpty extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final News news;

  NewsLoaded({@required this.news});

  @override
  List<Object> get props => [news];
}

class NewsError extends NewsState {}