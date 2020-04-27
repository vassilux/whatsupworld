import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whatsupworld/model/webcam.dart';
import 'package:whatsupworld/repository/webcams_provider.dart';

part 'webcams_event.dart';
part 'webcams_state.dart';

class WebcamsBloc extends Bloc<WebcamsEvent, WebcamsState> {

  final WebCamsProvider webcamsProvider;

  WebcamsBloc({@required this.webcamsProvider})
      : assert(webcamsProvider != null);

  @override
  WebcamsState get initialState => WebcamsEmpty();


  @override
  Stream<WebcamsState> mapEventToState(
    WebcamsEvent event,
  ) async* {
    if(event is FetchWebCams){
      yield* _mapFetchWebcamsToState(event);
    }
  }

  Stream<WebcamsState> _mapFetchWebcamsToState(FetchWebCams event) async* {
    yield WebcamsLoading();
    try {

      List<Webcam> webcams = await webcamsProvider.getAllWebCams(); 
      yield WebcamsLoaded(webcams : webcams);
    } catch (e) {   
      print(" Exception ${e.toString()}");
      yield WebcamsError(e.toString());
    }
  }

}
