import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsupworld/dashboard/index.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  // todo: check singleton for logic in project
  static final DashboardBloc _dashboardBlocSingleton = DashboardBloc._internal();
  factory DashboardBloc() {
    return _dashboardBlocSingleton;
  }
  DashboardBloc._internal();
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  DashboardState get initialState => UnDashboardState(0);

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    try {
      yield* await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'DashboardBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
