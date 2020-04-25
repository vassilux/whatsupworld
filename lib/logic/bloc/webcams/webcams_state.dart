part of 'webcams_bloc.dart';

abstract class WebcamsState extends Equatable {
  const WebcamsState();
}

class WebcamsInitial extends WebcamsState {
  @override
  List<Object> get props => [];
}

class WebcamsEmpty extends WebcamsState {
  @override
  List<Object> get props => [];
}

class WebcamsLoading extends WebcamsState {
  @override
  List<Object> get props => [];
}

class WebcamsLoaded extends WebcamsState {
  final List<Webcam> webcams;

  WebcamsLoaded({@required this.webcams});

  @override
  List<Object> get props => [webcams];
}

class WebcamsError extends WebcamsState {
  final String error;

  WebcamsError(this.error);

  @override
  List<Object> get props => [error];
}
