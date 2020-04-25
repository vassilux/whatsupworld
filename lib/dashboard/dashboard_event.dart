import 'dart:async';
import 'dart:developer' as developer;

import 'package:whatsupworld/dashboard/index.dart';
import 'package:meta/meta.dart';
import 'package:whatsupworld/repository/dashboard_repository.dart';

@immutable
abstract class DashboardEvent {
  Stream<DashboardState> applyAsync(
      {DashboardState currentState, DashboardBloc bloc});
  final DashboardRepository _dashboardRepository = DashboardRepository();
}

class UnDashboardEvent extends DashboardEvent {
  @override
  Stream<DashboardState> applyAsync({DashboardState currentState, DashboardBloc bloc}) async* {
    yield UnDashboardState(0);
  }
}

class LoadDashboardEvent extends DashboardEvent {
   
  final bool isError;
  @override
  String toString() => 'LoadDashboardEvent';

  LoadDashboardEvent(this.isError);

  @override
  Stream<DashboardState> applyAsync(
      {DashboardState currentState, DashboardBloc bloc}) async* {
    try {
      yield UnDashboardState(0);
      await Future.delayed(Duration(seconds: 1));
      
      yield InDashboardState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadDashboardEvent', error: _, stackTrace: stackTrace);
      yield ErrorDashboardState(0, _?.toString());
    }
  }
}
