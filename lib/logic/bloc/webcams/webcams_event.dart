part of 'webcams_bloc.dart';

abstract class WebcamsEvent extends Equatable {
  const WebcamsEvent();
}

class FetchWebCams extends WebcamsEvent {
  @override
  List<Object> get props => [];
}

